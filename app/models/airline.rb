class Airline < ActiveRecord::Base
  has_many :flights
  has_many :routes
  validates_uniqueness_of :name
end
