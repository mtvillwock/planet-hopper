class Route < ActiveRecord::Base
  belongs_to :airline
  # has_one :origin_airport_id
  # has_one :destination_airport_id
  # has_many :airports
end
