require 'httparty'

request_body = {
  "request" => {
    "slice" => [
      {
        "origin" => "BOS",
        "destination" => "LAX",
        "date" => "07-02-2015"
      },
    ],
    "passengers" => {
      "adultCount" => 1
    },
    "solutions" => 1,
    "refundable" => false
  }
}.to_json

p request_body

url = "https://www.googleapis.com/qpxExpress/v1/trips/search?prettyPrint=true&key=#{ENV['GOOGLE_API_KEY']}"
p request = HTTParty.post(url,
                                   body: request_body,
                                   headers: { 'Content-Type' => 'application/json',
                                              'Accept' => 'application/json' },
                                   followlocation: true)
p request.parsed_response