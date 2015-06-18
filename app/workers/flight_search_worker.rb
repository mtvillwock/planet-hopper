require 'typhoeus'

class FlightSearchWorker

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
        "solutions" => 10,
        "refundable" => false
      }
    }.to_json
    # will need to change number of solutions if using this as background job
    # that way can make many requests using Hydra without having client wait 10+ seconds
    @request_array = []
    p @hydra = Typhoeus::Hydra.new
    p request_hydra = Typhoeus::Request.new("https://www.googleapis.com/qpxExpress/v1/trips/search?prettyPrint=true&key=#{ENV['GOOGLE_API_KEY']}", method: :post, body: request, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }, followlocation: true)
    @request_array << request_hydra
    @hydra.queue(request_hydra)
    @hydra.run # making a 'parallel' api call after queueing all api calls
    @request_array.each do |request|
      ap final_response = JSON.parse(request.response.body)
    end
  end
end
