require 'net/http'
require 'json'

module KpiHelper  

  #
  # Import records for group from KPI API
  #

  def self.importRecordsForGroup(group)
    # Get current week from API
    currentWeek = getCurrentWeek

    # Update `updated_at` date of Group
    group.touch(:updated_at)
    unless group.save
      Rails.logger.error(errors.full_messages)
    end

    url = "https://api.rozklad.org.ua/v2/groups/#{group.server_id}/lessons"
    # Init URI
    uri = URI(url)

    if uri.nil?
      # Add error
      error_message = "Invalid URI"
      group.errors.add(:base, error_message)
      # Log invalid URI
      Rails.logger.error(error_message)
      return
    end

    # Perform request
    response = Net::HTTP.get_response(uri)
    if response.code != '200'
      # Add error
      error_message = "Server responded with code #{response.code} for GET #{uri}"
      group.errors.add(:base, error_message)
      # Log invalid URI
      Rails.logger.error(error_message)
      return
    end

    # Parse JSON
    json = JSON.parse(response.body)
    data = json["data"]

    # Delete old records
    Record.joins(:groups).where('groups.id': group.id).where("records.updated_at < ?", DateTime.current - 2.day).destroy_all

    currentDate = Date.current

    # Save records
    for object in data do

      # Get data from JSON
      time = object['time_start']
      pairName = object['lesson_number']
      nameString = object['lesson_full_name']
      kind = object['lesson_type']
      reason = object['lesson_room']
      dayNumber = object['day_number'].to_i
      lessonWeek = object['lesson_week'].to_i

      # Teahcer
      teachers = object['teachers']

      begin
        # Convert to int before find request

        # Teacher
        teacher = nil
        if teacherHash = teachers.first
          teacherID = teacherHash['teacher_id'].to_i
          teacher = Teacher.find_by(server_id: teacherID)
        end

        startDate = KpiHelper.getDate(currentWeek, time, dayNumber, lessonWeek)

        # Skip old records
        if startDate < currentDate
          next
        end

        # Conditions for find existing pair
        conditions = {}
        conditions[:start_date] = startDate
        conditions[:name] = nameString
        conditions[:pair_name] = pairName
        conditions[:reason] = reason
        conditions[:kind] = kind
        conditions[:time] = time

        # Try to find existing record first
        record = Record.find_by(conditions)

        if record.nil?
          # Save new record
          record = Record.new
          record.start_date = startDate
          record.time = time
          record.pair_name = pairName
          record.name = nameString
          record.reason = reason
          record.kind = kind

          # Associations
          record.teacher = teacher
          
          # Push only unique groups
          unless record.groups.include?(group)
           record.groups << group
         end

         unless record.save
            # Go to the next iteration if record can't be saved
            Rails.logger.error(record.errors.full_messages)
            next
          end
          
        else
          # Update record
          record.start_date = startDate
          record.time = time
          record.pair_name = pairName
          record.name = nameString
          record.reason = reason
          record.kind = kind

          # Associations
          record.teacher = teacher
          
          # Push only unique groups
          unless record.groups.include?(group)
           record.groups << group
         end

         unless record.save
            # Go to the next iteration if record can't be saved
            Rails.logger.error(record.errors.full_messages)
            next
          end
        end

      rescue Exception => e
        Rails.logger.error(e)
        next
      end
    end
  end

  #
  # Import records for teacher from KPI API
  #

  def self.importRecordsForTeacher(teacher)
    # Get current week from API
    currentWeek = getCurrentWeek

    # Update `updated_at` date of Teacher
    teacher.touch(:updated_at)
    unless teacher.save
      Rails.logger.error(errors.full_messages)
    end
    
    url = "https://api.rozklad.org.ua/v2/teachers/#{teacher.server_id}/lessons"

    # Init URI
    uri = URI(url)
    if uri.nil?
      # Add error
      error_message = "Invalid URI"
      teacher.errors.add(:base, error_message)
      # Log invalid URI
      Rails.logger.error(error_message)
      return
    end

    # Perform request
    response = Net::HTTP.get_response(uri)
    if response.code != '200'
      # Add error
      error_message = "Server responded with code #{response.code} for GET #{uri}"
      teacher.errors.add(:base, error_message)
      # Log invalid URI
      Rails.logger.error(error_message)
      return
    end

    # Parse JSON
    json = JSON.parse(response.body)
    data = json["data"]

    # Delete old records
    Record.where('teacher_id': teacher.id).where("updated_at < ?", DateTime.current - 2.day).destroy_all

    currentDate = DateTime.now.change({ hour: 0, min: 0, sec: 0 })

    # Save records
    for object in data do

      # Get data from JSON
      time = object['time_start']
      pairName = object['lesson_number']
      nameString = object['lesson_full_name']
      kind = object['lesson_type']
      reason = object['lesson_room']
      dayNumber = object['day_number'].to_i
      lessonWeek = object['lesson_week'].to_i

      # Groups
      groups = object['groups']

      begin
        # Group
        groupIDs = Array.new
        for group in groups do
          if id = group['group_id'].to_i
            groupIDs.push(id)
          end
        end
        groups = Group.where(server_id: groupIDs)

        # Pair start date
        startDate = KpiHelper.getDate(currentWeek, time, dayNumber, lessonWeek)

        # Skip old records
        if startDate < currentDate
          next
        end

        # Conditions for find existing pair
        conditions = {}
        conditions[:start_date] = startDate
        conditions[:name] = nameString
        conditions[:pair_name] = pairName
        conditions[:reason] = reason
        conditions[:kind] = kind
        conditions[:time] = time
        conditions[:teacher_id] = teacher.id

        # Try to find existing record first
        record = Record.find_by(conditions)

        if record.nil?
          # Save new record
          record = Record.new
          record.start_date = startDate
          record.time = time
          record.pair_name = pairName
          record.name = nameString
          record.reason = reason
          record.kind = kind

          # Associations
          record.teacher = teacher
          
          # Push only unique groups
          for group in groups do
            unless record.groups.include?(group)
             record.groups << group
           end
         end

         unless record.save
            # Go to the next iteration if record can't be saved
            Rails.logger.error(record.errors.full_messages)
            next
          end

        else
          record.start_date = startDate
          record.time = time
          record.pair_name = pairName
          record.name = nameString
          record.reason = reason
          record.kind = kind

          # Associations
          record.teacher = teacher
          
          # Push only unique groups
          for group in groups do
            unless record.groups.include?(group)
             record.groups << group
           end
         end

         unless record.save
            # Go to the next iteration if record can't be saved
            Rails.logger.error(record.errors.full_messages)
            next
          end
        end
        
      rescue Exception => e
        Rails.logger.error(e)
        next
      end
    end
  end


  #
  # Import groups from KPI API
  #

  # bin/rails runner 'KpiHelper.importGroups'
  def self.importGroups
    groupsTotalCount = KpiHelper.getGroupsCount

    # This groups for KPI
    university = University.find_by(url: "kpi")

    # Delete before save
    Group.where(university_id: university.id).destroy_all

    offset = 0

    while offset < groupsTotalCount
      # Get json with groups from API
      json = KpiHelper.getGroups(offset)

      # Save to database
      KpiHelper.saveGroupsFrom(json)

      offset += 100
    end
  end


   # Make request to API for get total count of all groups
   def self.getGroupsCount
    # Init URI
    uri = URI("https://api.rozklad.org.ua/v2/groups")
    if uri.nil?
      # Add error
      error_message = "Invalid URI"
      # Log invalid URI
      Rails.logger.error(error_message)
      return
    end

    # Perform request
    response = Net::HTTP.get_response(uri)
    if response.code != '200'
      # Add error
      error_message = "Server responded with code #{response.code} for GET #{uri}"
      # Log invalid URI
      Rails.logger.error(error_message)
      return
    end

    # Parse JSON
    json = JSON.parse(response.body)

    totalCount = json["meta"]["total_count"]
    teachersTotalCount = Integer(totalCount)

    return teachersTotalCount
  end


  # Make request with offset parameter and parse JSON
  def self.getGroups(offset)
     # Init URI
     uri = URI("https://api.rozklad.org.ua/v2/groups/?filter={%27limit%27:100,%27offset%27:#{offset}}")
     if uri.nil?
      # Add error
      error_message = "Invalid URI"
      # Log invalid URI
      Rails.logger.error(error_message)
      return
    end

     # Perform request
     response = Net::HTTP.get_response(uri)
     if response.code != '200'
      # Add error
      error_message = "Server responded with code #{response.code} for GET #{uri}"
      # Log invalid URI
      Rails.logger.error(error_message)
      return
    end

    # Parse JSON
    json = JSON.parse(response.body)

    return json
  end


  # Serialize groups from JSON and save to database
  def self.saveGroupsFrom(json)

    data = json["data"]

    # This groups for SumDU
    university = University.find_by(url: "kpi")
    
    for object in data do

      begin
        # Convert before save
        serverID = Integer(object["group_id"])
        groupName = String(object["group_full_name"])

        # Save new group
        group = Group.new
        group.server_id = serverID
        group.name = groupName
        group.university = university

        unless group.save
          # Go to the next iteration if can't be saved
          Rails.logger.error(group.errors.full_messages)
          next
        end

      rescue Exception => e
        Rails.logger.error(e)
        next
      end
    end
  end

  #
  # Get current week from KPI API
  #

  # Request current week from KPI API
  def self.getCurrentWeek
    # Init URI
    uri = URI("https://api.rozklad.org.ua/v2/weeks")
    if uri.nil?
      # Add error
      error_message = "Invalid URI"
      # Log invalid URI
      Rails.logger.error(error_message)
      return
    end

    # Perform request
    response = Net::HTTP.get_response(uri)
    if response.code != '200'
      # Add error
      error_message = "Server responded with code #{response.code} for GET #{uri}"
      # Log invalid URI
      Rails.logger.error(error_message)
      return
    end

    # Parse JSON
    json = JSON.parse(response.body)
    week = json['data']

    return week
  end

  def self.getDate(currentWeek, timeStart, dayNumber, lessonWeek)
    # Params for generate date
    recordDate = DateTime.now.change({ hour: 0, min: 0, sec: 0 })

    if currentWeek == lessonWeek
      # Current week
      currentWeekDay = DateTime.current.wday

      # Calculate pair date
      dayShift = 0
      if currentWeekDay > dayNumber
        dayShift = currentWeekDay - dayNumber
        recordDate = recordDate - dayShift.days

      elsif currentWeekDay < dayNumber
        dayShift = dayNumber - currentWeekDay 
        recordDate = recordDate + dayShift.days
      end
    else
      # Next week
      recordDate = recordDate.next_week.beginning_of_week
      dayShift = dayNumber - 1
      recordDate = recordDate + dayShift.days
    end
    return recordDate
  end

  #
  # Import teachers from KPI API
  #

  # Import from KPI
  # bin/rails runner 'KpiHelper.importTeachers'
  def self.importTeachers
    teachersTotalCount = KpiHelper.getTeachersCount

    # This teachers for KPI
    university = University.find_by(url: "kpi")

    # Delete before save
    Teacher.where(university_id: university.id).destroy_all

    offset = 0

    while offset < teachersTotalCount
      # Get json with teachers from API
      json = KpiHelper.getTeachers(offset)

      # Save to database
      KpiHelper.saveTeachersFrom(json)

      offset += 100
    end
  end


  # Make request to API for get total count of all teachers
  def self.getTeachersCount
    # Init URI
    uri = URI("https://api.rozklad.org.ua/v2/teachers")
    if uri.nil?
      # Add error
      error_message = "Invalid URI"
      # Log invalid URI
      Rails.logger.error(error_message)
      return
    end

    # Perform request
    response = Net::HTTP.get_response(uri)
    if response.code != '200'
      # Add error
      error_message = "Server responded with code #{response.code} for GET #{uri}"
      # Log invalid URI
      Rails.logger.error(error_message)
      return
    end

    # Parse JSON
    json = JSON.parse(response.body)

    totalCount = json["meta"]["total_count"]
    teachersTotalCount = Integer(totalCount)

    return teachersTotalCount
  end


  # Make request with offset parameter and parse JSON
  def self.getTeachers(offset)
     # Init URI
     uri = URI("https://api.rozklad.org.ua/v2/teachers/?filter={%27limit%27:100,%27offset%27:#{offset}}")
     if uri.nil?
      # Add error
      error_message = "Invalid URI"
      # Log invalid URI
      Rails.logger.error(error_message)
      return
    end

     # Perform request
     response = Net::HTTP.get_response(uri)
     if response.code != '200'
      # Add error
      error_message = "Server responded with code #{response.code} for GET #{uri}"
      # Log invalid URI
      Rails.logger.error(error_message)
      return
    end

    # Parse JSON
    json = JSON.parse(response.body)

    return json
  end


  # Serialize teachers from JSON and save to database
  def self.saveTeachersFrom(json)

    data = json["data"]

    # This groups for SumDU
    university = University.find_by(url: "kpi")
    
    for object in data do

      begin

        # Convert before save
        serverID = Integer(object["teacher_id"])
        teacherName = String(object["teacher_name"])

        # Save new teacher
        teacher = Teacher.new
        teacher.server_id = serverID
        teacher.name = teacherName
        teacher.university = university

        unless teacher.save
          # Go to the next iteration if can't be saved
          Rails.logger.error(teacher.errors.full_messages)
          next
        end

      rescue Exception => e
        Rails.logger.error(e)
        next
      end

    end
  end

end