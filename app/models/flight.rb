class Flight < ActiveRecord::Base
  belongs_to :trip
  belongs_to :airline
  has_one :origin, class_name: "Airport"
  has_one :destination, class_name: "Airport"
  # need to connect to route using :through
end
