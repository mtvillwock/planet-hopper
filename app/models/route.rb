class Route < ActiveRecord::Base
  belongs_to :airline
  belongs_to :flight
# Need to sort this out so you can do airline.route.origin and flight.route.destination using :through
  belongs_to :origin_airport, class_name: 'Airport'
  belongs_to :destination_airport, class_name: 'Airport'
  # has_many :airports
end
