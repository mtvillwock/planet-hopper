class User < ActiveRecord::Base
  has_secure_password

  has_many :trips
  has_many :passports

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password_digest
  validates_uniqueness_of :password_digest
end
