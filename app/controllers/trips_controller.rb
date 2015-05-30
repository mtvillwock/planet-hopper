class TripsController < ApplicationController
  def index
    @trip = Trip.new
  end

  def show
    # need error handling here
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def get_cities
    # fetch all cities and compare possible matches to input from AJAX call
    # return list of cities that match based on comparing N letters
    # received from AJAX call with N letters of each city in cities array
    # City model/migration could be useful but for
    # now I am spoofing it with a sample array
    city_options = []
    possible_cities = ["London", "Tokyo", "San Francisco", "New York", "Madison", "Milwaukee", "Boston", "Los Angeles", "Toronto", "San Diego", "Santa Clara", "Green Bay"]
    # maybe a hash with city name as a string and city object as a value
    p "form input is: "
    p params[:city_input]
    possible_cities.each do |city|
      p "city is: "
      p city
      p "portion of option city minus input: "
      p city[0..params[:city_input].length - 1]
      city_options << city if city[0..params[:city_input].length - 1].downcase == params[:city_input].downcase
    end
    p "the options are: "
    p city_options
    render json: { city_options: city_options }
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
