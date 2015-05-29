class TripsController < ApplicationController
  def index
    @trip = Trip.new
  end

  def show
    # need error handling here
    @trip = Trip.find(params[:id])
  end

  def new
#    @trip = Trip.new
# don't have to use @trip here because the index page is already providing it for the partial form that is rendered
# respond_to do |format|

#   format.html # show.html.erb
#   format.json { render json: @user }

#  end
    render partial: "trip_info",
    locals: { foo: "test var"}, layout: false
  end

  def get_cities
    # fetch all cities and compare possible matches to input from AJAX call
    # return list of cities that match based on compariing N letters
    # received from AJAX call with N letters of each city in cities collection
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
