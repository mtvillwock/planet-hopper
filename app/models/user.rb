require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_many :trips
  has_many :passports

  validates_presence_of :email, :password_hash
  validates_uniqueness_of :email, :password_hash

  private
  ## Bcrypt
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
