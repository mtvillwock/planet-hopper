class Airport < ActiveRecord::Base
  belongs_to :city
  belongs_to :flight
end
