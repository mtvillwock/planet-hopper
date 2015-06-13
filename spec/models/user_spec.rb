require 'rails_helper'

RSpec.describe User, :type => :model do
  context "associations" do
    it { should have_many :trips }
    it { should have_many :passports }
  end
  context 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password_digest }

    # it { should validate_presence_of :first_name }
    # it { should validate_presence_of :last_name }
  end

  context 'valid User' do
    it 'is valid with a email and password' do
      user = User.new(first_name: "John", last_name: "Smith", email: "test@test.com")
      user.password = "test"
      expect(user).to be_valid
    end
  end

  context 'invalid User' do
    it 'is invalid without an email' do
      user = User.new(first_name: "John", last_name: "Smith", email: nil)
      user.password = "test"
      expect(user).to be_invalid
    end
  end
end
