class Airport < ActiveRecord::Base
  belongs_to :city
  # should this use polymorphic, such as airportable with type 'origin' and 'destination'??
  has_many :routes, foreign_key: 'origin_airport_id'
  has_many :routes, foreign_key: 'destination_airport_id'
  has_many :flights, through: :routes
end
