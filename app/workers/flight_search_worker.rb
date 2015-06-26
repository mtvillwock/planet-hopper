require 'typhoeus'

class FlightSearchWorker
  include Sidekiq::Worker

  def parse_airports(data)
    airports_hashes = []
    data.each do |el|
      airports_hashes << { code: el["code"],
                           city: el["city"],
                           name: el["name"] }
    end
  end

  def parse_flight(data)
    flight_hash = {
      origin: data["origin"],
      destination: data["destination"],
      arrival_time: data["arrivalTime"],
      departure_time: data["departureTime"]
    }
  end

  def parse_cities(data)
    city_hashes = []
    data.each do |el|
      city_hashes << { code: el["code"],
                       city: el["name"] }
    end
  end

  def parse_carrier(data)
    carriers_hash = {}
    data.each do |el|
      carriers_hash = { code: el["code"], name: el["name"] }
    end
  end

  def parse(response)
    trip_data = response["trips"]["data"]
    airports = trip_data["airport"] # array of hashes with code, city, name
    cities = trip_data["city"] # array of hashes with code and name
    carriers = trip_data["carrier"] # array of hashes with code and name
    trip_options = response["trips"]["tripOption"].first # hash with saleTotal and slice
    cost = trip_options["saleTotal"] #(USD + floating digits)
    flight_slice = trip_options["slice"].first # hashes including segment and leg
    flight_leg = flight_slice["segment"].first["leg"].first # hash with origin and destination codes and terminals, as well as arrival and departure timestamps
    airports = parse_airports(airports)
    cities = parse_cities(cities)
    carriers = parse_carrier(carriers)
    flight = parse_flight(flight_leg)
    data = {
      airports: airports,
      cities: cities,
      carriers: carriers,
      flight: flight
    }
  end

  def perform(args)
    p args
    # dates come in as these weird params
    # rails knows how to handle them for objects, but this needs to be done here manually for the API call
    # "start_date(1i)"=>"2015", "start_date(2i)"=>"7", "start_date(3i)"=>"2"
    year = args["start_date(1i)"]
    month = args["start_date(2i)"]
    day = args["start_date(3i)"]
    start_date = [year, month, day].join("-")
    p start_date
    p airport = Airport.where(airport_code: args[:destination_city]).first!
    # make request to get flight and parse response
    # include another slice for roundtrip
    p  request = {
      "request" => {
        "slice" => [
          {
            "origin" => args[:origin_city],
            "destination" => airport.airport_code,
            "date" => start_date
          },
        ],
        "passengers" => {
          "adultCount" => 1
        },
        "solutions" => 1,
        "refundable" => false
      }
    }.to_json
    # will need to change number of solutions if using this as background job
    # that way can make many requests using Hydra without having client wait 10+ seconds
    @request_array = []
    @hydra = Typhoeus::Hydra.new
    p request_hydra = Typhoeus::Request.new("https://www.googleapis.com/qpxExpress/v1/trips/search?prettyPrint=true&key=#{ENV['GOOGLE_API_KEY']}", method: :post, body: request, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }, followlocation: true)
    @request_array << request_hydra
    @hydra.queue(request_hydra)
    @hydra.run # making a 'parallel' api call after queueing all api calls
    final_response = ""
    @request_array.each do |request|
      final_response = JSON.parse(request.response.body)
    end
    final_response
    parse(final_response)
  end
end
