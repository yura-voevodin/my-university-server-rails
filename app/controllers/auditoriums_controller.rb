class AuditoriumsController < ApplicationController
  before_action :set_auditorium, only: [:show]

  # GET /auditoriums
  # GET /auditoriums.json
  def index
    @auditoriums = Auditorium.all
  end

  # GET /auditoriums/1
  # GET /auditoriums/1.json
  def show
    # Check if need to update records
    if @auditorium.needToUpdateRecords

      # Delete old records
      @auditorium.records.destroy_all

      # Import new
      @auditorium.importRecords

      redirect_to request.url, notice: "Records has been updated!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auditorium
      @auditorium = Auditorium.find(params[:id])
    end
end
