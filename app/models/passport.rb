class Passport < ActiveRecord::Base
  belongs_to :user
  # has_many :countries
  has_one :country
  # I think this is has one... the country that is issuing it
end
