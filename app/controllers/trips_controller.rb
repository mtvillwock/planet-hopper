class TripsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(
      destination_country: params[:trip][:destination_country],
      destination_city: params[:trip][:destination_city],
      start_date: params[:trip][:start_date],
      end_date: params[:trip][:end_date],
      origin_country: params[:trip][:origin_country],
      origin_city: params[:trip][:origin_city])
    # Revise based on link below:
    # http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
    # @trip = Trip.new(params[:trip])
    if @trip.save
      render json: { success: "trip created" }
    else
      render json: { error: "trip failed to create" }
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
