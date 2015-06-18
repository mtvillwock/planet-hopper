require 'httparty'
class FlightSearchWorker
  include HTTParty

  def perform
    key = ENV["GOOGLE_API_KEY"]

    flight = Flight.new
    # make request to get flight and parse response
    request = HTTParty.post("https://www.googleapis.com/qpxExpress/v1/trips/search?prettyPrint=true&key=#{key}")
    p "The flight is "
    p flight
  end
end