class Airport < ActiveRecord::Base
  belongs_to :city
  has_one :route, foreign_key: 'destination_airport_id'
  has_one :route, foreign_key: 'origin_airport_id'
  has_one :flight, through: :route
end
