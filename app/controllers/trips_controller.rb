class TripsController < ApplicationController
  before_action :authorize

  def index
    user = current_user
    @trips = user.trips.all
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
    user = current_user
    p trip_params
    @trip = Trip.new(trip_params)
    if @trip.save
      user.trips << @trip
      p @trip.attributes
      TripInfoWorker.new.perform(@trip.id)
      FlightSearchWorker.new.perform(trip_params)
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

  def departure_airports
    # fetch all airports, compare possible matches to input from AJAX call
    # City model/migration could be useful, spoofing it with a sample array
    airport_options = []
    possible_airports = ["SFO", "JFK", "SEA-TAC", "DFW", "SBA", "SBP", "SBN"]
    # maybe a hash with city name as a string and city object as a value
    p "form input is: "
    p params[:airport_input]
    # Switch this in JS and here
    # Make params match up with form input names
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

  def get_cities
    # fetch all airports, compare possible matches to input from AJAX call
    # City model/migration could be useful, spoofing it with a sample array
    airport_options = []
    possible_airports = ["SFO", "JFK", "SEA-TAC", "DFW", "SBA", "SBP", "SBN", "LAX", "BOS", "GRB"]
    # maybe a hash with city name as a string and city object as a value
    # possible_airports = Airport.all.map { |airport| airport.airport_code }
    # p possible_airports
    # possible_airports = Airport.where(airport_code: params[:city_input])
    p "form input is: "
    p params[:city_input]
    # Switch this in JS and here
    # Make params match up with form input names
    possible_airports.each do |airport|
      airport_options << airport if airport[0..params[:city_input].length - 1].downcase == params[:city_input].downcase
    end
    p "the options are: "
    p airport_options
    render json: { city_options: airport_options }
    # fetch all cities and compare possible matches to input from AJAX call
    # return list of cities that match based on comparing N letters
    # received from AJAX call with N letters of each city in cities array
    # City model/migration could be useful but for
    # now I am spoofing it with a sample array
    # city_options = []
    # possible_cities = ["London", "Tokyo", "San Francisco", "New York", "Madison", "Milwaukee", "Boston", "Los Angeles", "Toronto", "San Diego", "Santa Clara", "Green Bay"]
    # # maybe a hash with city name as a string and city object as a value
    # p "form input is: "
    # p params[:city_input]
    # # Switch this in JS and here to destination_city
    # # Make params match up with form input names
    # possible_cities.each do |city|
    #   p "city is: "
    #   p city
    #   p "portion of option city minus input: "
    #   p city[0..params[:city_input].length - 1]
    #   city_options << city if city[0..params[:city_input].length - 1].downcase == params[:city_input].downcase
    # end
    # p "the options are: "
    # p city_options
    # render json: { city_options: city_options }
  end

  def timespans
    timespan_options = []
    possible_timespans = ["days", "weeks", "months", "years"]
      timespan_options = possible_timespans
    p timespan_options
    render json: { timespan_options: timespan_options }
  end

  def destination_countries
    country_options = []
    possible_countries = ["United States", "United Kingdom", "Canada", "Ireland", "China", "New Zealand", "Australia", "Japan"]
    # maybe a hash with country name as a string and country object as a value
    p "form input is: "
    p params[:destination_country]
    possible_countries.each do |country|
      p "country is: "
      p country
      p "portion of option country minus input: "
      p country[0..params[:destination_country].length - 1]
      country_options << country if country[0..params[:destination_country].length - 1].downcase == params[:destination_country].downcase
    end
    p "the options are: "
    p country_options
    render json: { country_options: country_options }
  end

  def origin_countries
    country_options = []
    possible_countries = ["United States", "United Kingdom", "Canada", "Ireland", "China", "New Zealand", "Australia", "Japan"]
    # maybe a hash with country name as a string and country object as a value
    p "form input is: "
    p params[:origin_country]
    possible_countries.each do |country|
      p "country is: "
      p country
      p "portion of option country minus input: "
      p country[0..params[:origin_country].length - 1]
      country_options << country if country[0..params[:origin_country].length - 1].downcase == params[:origin_country].downcase
    end
    p "the options are: "
    p country_options
    render json: { country_options: country_options }
  end

  private
  def trip_params
    params.require(:trip).permit(
      :start_date,
      :end_date,
      :duration,
      :timespan,
      :destination_city,
      :destination_country,
      :origin_city,
    :origin_country)
  end
end
