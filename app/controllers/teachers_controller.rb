class TeachersController < ApplicationController

  # GET /teachers
  # GET /teachers.json
  def index
    @university = University.find_by(url: params[:university_url])
    if @university.blank?
      raise ActionController::RoutingError.new('Not Found')  
    end
    
    @teachers = Teacher.where(university_id: @university.id).all
    @title = @university.short_name + ' - Викладачі'
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
    @university = University.find_by(url: params[:university_url])
    if @university.blank?
      raise ActionController::RoutingError.new('Not Found')  
    end

    @teacher = Teacher.find_by(university_id: @university.id, id: params[:id])
    if @teacher.blank?
      raise ActionController::RoutingError.new('Not Found')  
    end

    @title = @university.short_name + ' - ' + @teacher.name
  end

  # GET /teachers/1/records
  def records
    @university = University.find_by(url: params[:university_url])
    if @university.blank?
      raise ActionController::RoutingError.new('Not Found')
    end

    @teacher = Teacher.find_by(university_id: @university.id, id: params[:id])
    if @teacher.blank?
      raise ActionController::RoutingError.new('Not Found')
    end

    # Check if need to update records
    if @teacher.needToUpdateRecords
      # Import new
      @teacher.importRecords
    end
    
    @records = Record.where(university_id: @university.id, teacher_id: @teacher.id).where("start_date >= ?", DateTime.current).order(:start_date).order(:pair_name)
    @records_days = @records.group_by { |t| t.start_date }
    
    if @records.empty?
      render :partial => "records/empty"
    else
      render :partial => "records/show", :locals => {:records => @records, :university =>  @university}
    end
  end
end