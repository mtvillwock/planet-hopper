class Flight < ActiveRecord::Base
  belongs_to :trip
  belongs_to :airline#, through: :route
  has_one :route
  has_one :destination, class_name: 'Airport', through: :route
  has_one :origin, class_name: 'Airport', through: :route

  validates_presence_of :trip_id
  validates_presence_of :arrival_time
  validates_presence_of :departure_time
end
