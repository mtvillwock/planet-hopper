class Route < ActiveRecord::Base
  belongs_to :airline

# Need to sort this out so you can do airline.route.origin and flight.route.destination using :through
  # has_one :origin_airport_id
  # has_one :destination_airport_id
  # has_many :airports
end
