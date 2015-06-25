class Flight < ActiveRecord::Base
  belongs_to :trip
  # belongs_to :airline, through: :route
  has_one :route
  has_one :destination, class_name: 'Airport', through: :route
  has_one :origin, class_name: 'Airport', through: :route
end
