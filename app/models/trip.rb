class Trip < ActiveRecord::Base
  has_many :flights
end
