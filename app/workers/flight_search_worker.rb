require 'typhoeus'

class FlightSearchWorker

  def perform(args)
    p args
    p airport = Airport.where(airport_code: args[:destination_city]).first!
    # make request to get flight and parse response
    # include another slice for roundtrip
   p  request = {
      "request" => {
        "slice" => [
          {
            "origin" => args[:origin_city],
            "destination" => airport,
            "date" => args[:start_date]
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

    p request_hydra = Typhoeus::Request.new("https://www.googleapis.com/qpxExpress/v1/trips/search?prettyPrint=true&key=#{ENV['GOOGLE_API_KEY']}", method: :post, body: request, headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }, followlocation: true)
  end
end
