class Airport < ActiveRecord::Base
  belongs_to :city
  has_many :routes, foreign_key: 'origin_airport_id'
  has_many :routes, foreign_key: 'destination_airport_id'
  has_many :flights, through: :routes
end
