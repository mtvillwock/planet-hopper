class Airline < ActiveRecord::Base
  has_many :flights
  has_many :routes
end
