# frozen_string_literal: true

require 'net/http'
require 'json'

# Import data for SumDU university
class SumduService

  def self.sumdu_api_url
    'https://schedule.sumdu.edu.ua/index/json'
  end

  #
  # Import records for auditorium from SumDU API
  #
  def self.import_records_for_auditorium(auditorium, date)
    start_date = date.strftime('%d.%m.%Y')
    end_date = (date + 1.day).strftime('%d.%m.%Y')

    url = "#{self.sumdu_api_url}?method=getSchedules"
    query = "&id_aud=#{auditorium.server_id}&date_beg=#{start_date}&date_end=#{end_date}"

    # Perform network request and parse JSON
    json = ApplicationRecord.perform_request(url + query)

    # JSON may be nil
    return if json.nil?

    university = University.sumdu

    # Save records
    json.each do |object|
      # Get data from JSON
      date_string = object['DATE_REG']
      time = object['TIME_PAIR']
      pair_name = object['NAME_PAIR']
      name_string = object['ABBR_DISC']
      reason = object['REASON']
      kind = object['NAME_STUD']

      # Teacher
      kod_fio = object['KOD_FIO']

      # Group
      name_group = object['NAME_GROUP']

      begin
        # Split groups into array
        group_names = name_group.split(',')

        # Groups
        striped_names = []
        group_names.each do |group_name|
          striped_names.push(group_name.strip)
        end
        groups = Group.where(university: university, name: striped_names)

        # Teacher
        # Convert to int before find request
        teacher_id = kod_fio.to_i
        teacher = Teacher.where(university: university, server_id: teacher_id).first

        # Get pair date and time
        pair_time = time.split('-').first
        pair_start_date = (date_string + ' ' + pair_time).to_datetime

        # Save or update Record
        save_or_update_record(pair_start_date, time, name_string, pair_name, reason, kind, auditorium, teacher, groups, university)
      rescue StandardError => e
        Rails.logger.error(e)
        next
      end
    end

    # Update `updated_at` date of Auditorium
    auditorium.touch(:updated_at)
    Rails.logger.error(errors.full_messages) unless auditorium.save
  end

  #
  # Import records for group from SumDU API
  #
  def self.import_records_for_group(group, date)
    start_date = date.strftime('%d.%m.%Y')
    end_date = (date + 1.day).strftime('%d.%m.%Y')

    url = "#{self.sumdu_api_url}?method=getSchedules"
    query = "&id_grp=#{group.server_id}&date_beg=#{start_date}&date_end=#{end_date}"

    # Perform network request and parse JSON
    json = ApplicationRecord.perform_request(url + query)

    # JSON may be nil
    return if json.nil?

    university = University.sumdu

    # Save records
    json.each do |object|
      # Get data from JSON
      date_string = object['DATE_REG']
      time = object['TIME_PAIR']
      pair_name = object['NAME_PAIR']
      name_string = object['ABBR_DISC']
      reason = object['REASON']
      kind = object['NAME_STUD']

      # Auditorium
      kod_aud = object['KOD_AUD']

      # Teacher
      kod_fio = object['KOD_FIO']

      begin
        # Convert to int before find request

        # Auditorium
        auditorium_id = kod_aud.to_i
        auditorium = Auditorium.find_by(university_id: university.id, server_id: auditorium_id)

        # Teacher
        teacher_id = kod_fio.to_i
        teacher = Teacher.find_by(university_id: university.id, server_id: teacher_id)

        # Get pair date and time
        pair_time = time.split('-').first
        pair_start_date = (date_string + ' ' + pair_time).to_datetime

        # Save or update Record
        save_or_update_record(pair_start_date, time, name_string, pair_name, reason, kind, auditorium, teacher, [group], university)
      rescue StandardError => e
        Rails.logger.error(e)
        next
      end
    end

    # Update `updated_at` date of Group
    group.touch(:updated_at)
    Rails.logger.error(errors.full_messages) unless group.save
  end

  #
  # Import records for teacher from SumDU API
  #
  def self.import_records_for_teacher(teacher, date)
    start_date = date.strftime('%d.%m.%Y')
    end_date = (date + 1.day).strftime('%d.%m.%Y')

    # TODO: Check dates

    url = "#{self.sumdu_api_url}?method=getSchedules"
    query = "&id_fio=#{teacher.server_id}&date_beg=#{start_date}&date_end=#{end_date}"

    # Perform network request and parse JSON
    json = ApplicationRecord.perform_request(url + query)

    # JSON may be nil
    return if json.nil?

    university = University.sumdu

    # Save records
    json.each do |object|
      # Get data from JSON
      date_string = object['DATE_REG']
      time = object['TIME_PAIR']
      pair_name = object['NAME_PAIR']
      name_string = object['ABBR_DISC']
      reason = object['REASON']
      kind = object['NAME_STUD']

      # Auditorium
      kod_aud = object['KOD_AUD']

      # Group
      name_group = object['NAME_GROUP']

      begin
        # Split groups into array
        group_names = name_group.split(',')

        # Groups
        striped_names = []
        group_names.each do |group_name|
          striped_names.push(group_name.strip)
        end
        groups = Group.where(university: university, name: striped_names)

        # Auditorium
        # Convert to int before find request
        auditorium_id = kod_aud.to_i
        auditorium = Auditorium.where(university: university, server_id: auditorium_id).first

        # Get pair date and time
        pair_time = time.split('-').first
        pair_start_date = (date_string + ' ' + pair_time).to_datetime

        # Save or update Record
        save_or_update_record(pair_start_date, time, name_string, pair_name, reason, kind, auditorium, teacher, groups, university)
      rescue StandardError => e
        Rails.logger.error(e)
        next
      end
    end

    # Update `updated_at` date of Teacher
    teacher.touch(:updated_at)
    Rails.logger.error(errors.full_messages) unless teacher.save
  end

  #
  # Import auditoriums from SumDU API
  #
  # # bin/rails runner 'SumduService.import_auditoriums'
  def self.import_auditoriums
    # Perform network request and parse JSON
    url = "#{self.sumdu_api_url}?method=getAuditoriums"
    json = ApplicationRecord.perform_request(url)

    # JSON may be nil
    return if json.nil?

    # This groups for SumDU
    university = University.sumdu

    json.each do |object|
      # Convert to int before save
      server_id = Integer(object[0])
      auditorium_name = object[1]

      # Building name
      building_name = ''
      if auditorium_name.include? '-'
        building_name = auditorium_name.split('-').first
      elsif auditorium_name.include? '_'
        building_name = auditorium_name.split('_').first
      end
      building = Building.where(university: university).where('name LIKE ?', "#{building_name}%").first

      # Conditions for find existing auditorium
      conditions = {}
      conditions[:university_id] = university.id
      conditions[:server_id] = server_id
      conditions[:name] = auditorium_name

      # Try to find existing auditorium first
      auditorium = Auditorium.find_by(conditions)

      auditorium = Auditorium.new if auditorium.nil?
      auditorium.server_id = server_id
      auditorium.name = auditorium_name
      auditorium.university = university

      if auditorium.building.nil?
        # Assign building if empty
        auditorium.building = building
      end

      unless auditorium.save
        # Go to the next iteration if can't be saved
        Rails.logger.error auditorium.errors.full_messages
        next
      end
    rescue StandardError => e
      Rails.logger.error e
      next
    end
  end

  #
  # Import groups from SumDU API
  #
  # bin/rails runner 'SumduService.import_groups'
  def self.import_groups
    # Perform network request and parse JSON
    url = "#{self.sumdu_api_url}?method=getGroups"
    json = ApplicationRecord.perform_request(url)

    # JSON may be nil
    return if json.nil?

    # This groups for SumDU
    university = University.sumdu

    json.each do |object|
      # Convert to int before save
      server_id = Integer(object[0])
      group_name = object[1]

      # Conditions for find existing group
      conditions = {}
      conditions[:university_id] = university.id
      conditions[:server_id] = server_id
      conditions[:name] = group_name

      # Try to find existing group first
      group = Group.find_by(conditions)

      if group.nil?
        # Save new group
        group = Group.new
        group.server_id = server_id
        group.name = group_name
        group.university = university

        unless group.save
          # Go to the next iteration if can't be saved
          Rails.logger.error(group.errors.full_messages)
          next
        end
      end
    rescue StandardError => e
      Rails.logger.error(e)
      next
    end
  end

  #
  # Import teachers from SumDU API
  #
  # bin/rails runner 'SumduService.import_teachers'
  def self.import_teachers
    # Perform network request and parse JSON
    url = "#{self.sumdu_api_url}?method=getTeachers"
    json = ApplicationRecord.perform_request(url)

    # JSON may be nil
    return if json.nil?

    # This teachers for SumDU
    university = University.sumdu

    json.each do |object|
      # Convert to int before save
      server_id = Integer(object[0])
      teacher_name = object[1]

      # Conditions for find existing teacher
      conditions = {}
      conditions[:university_id] = university.id
      conditions[:server_id] = server_id
      conditions[:name] = teacher_name

      # Try to find existing teacher first
      teacher = Teacher.find_by(conditions)

      if teacher.nil?
        # Save new teacher
        teacher = Teacher.new
        teacher.server_id = server_id
        teacher.name = teacher_name
        teacher.university = university

        unless teacher.save
          # Go to the next iteration if can't be saved
          Rails.logger.error(teacher.errors.full_messages)
          next
        end
      end
    rescue StandardError => e
      Rails.logger.error(e)
      next
    end
  end

  #
  # Record
  #
  def self.save_or_update_record(pair_start_date, time, name_string, pair_name, reason, kind, auditorium, teacher, groups, university)
    # Conditions for find existing pair
    conditions = {}
    conditions[:university_id] = university.id
    conditions[:pair_start_date] = pair_start_date
    conditions[:name] = name_string
    conditions[:pair_name] = pair_name
    conditions[:reason] = reason
    conditions[:kind] = kind
    conditions[:time] = time

    # Try to find existing record first
    record = Record.find_by(conditions)

    if record.nil?
      # New record
      record = Record.new
    end

    # Update record
    record.pair_start_date = pair_start_date
    record.time = time
    record.pair_name = pair_name
    record.name = name_string
    record.reason = reason
    record.kind = kind
    record.university = university

    # Associations
    record.auditorium = auditorium
    record.teacher = teacher

    # Push only unique groups
    groups.each do |group|
      record.groups << group unless record.groups.include?(group)
    end

    # Save or update Discipline
    discipline = save_discipline(name_string, auditorium, groups, teacher)
    record.discipline = discipline

    return if record.save
  end

  #
  # Import Discipline
  #
  def self.save_discipline(name, auditorium, groups, teacher)
    university = University.sumdu
    discipline = Discipline.save_or_update(name, university, auditorium, groups, teacher)
    discipline
  end
end
