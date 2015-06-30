class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :flights


  validates_presence_of :origin_city, :origin_country, :destination_city, :destination_country, :timespan, :duration
  validates_presence_of :start_date, :end_date
end
