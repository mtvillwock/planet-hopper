class Flight < ActiveRecord::Base
  belongs_to :trip
  belongs_to :airline
  # need to connect to route using :through
end
