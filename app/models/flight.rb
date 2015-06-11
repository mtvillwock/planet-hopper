class Flight < ActiveRecord::Base
  belongs_to :trip
  belongs_to :airline
end
