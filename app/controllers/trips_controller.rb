class TripsController < ApplicationController
  def index
    # current_user.trips.all
    @trips = Trip.all
    @trip = Trip.new
  end

  def show
    # need error handling here
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end


  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      redirect_to @trip
    else
      render 'new'
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      redirect_to @trip
    else
      render 'edit'
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    if @trip.destroy
      redirect_to trips_path
    else
      redirect_to @trip
    end
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

  def departure_airports
    # fetch all airports, compare possible matches to input from AJAX call
    # City model/migration could be useful, spoofing it with a sample array
    airport_options = []
    possible_airports = ["SFO", "JFK", "SEA-TAC", "DFW", "SBA", "SBP", "SBN"]
    # maybe a hash with city name as a string and city object as a value
    p "form input is: "
    p params[:airport_input]
    possible_airports.each do |airport|
      p "airport is: "
      p airport
      p "portion of option city minus input: "
      p airport[0..params[:airport_input].length - 1]
      airport_options << airport if airport[0..params[:airport_input].length - 1].downcase == params[:airport_input].downcase
    end
    p "the options are: "
    p airport_options
    render json: { airport_options: airport_options }
  end

  private
  def trip_params
    params.require(:trip).permit(
      :start_date,
      :end_date,
      :destination_city,
      :destination_country,
      :origin_city,
      :origin_country)
  end
end
