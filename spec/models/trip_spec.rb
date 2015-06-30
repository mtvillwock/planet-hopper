require 'rails_helper'

RSpec.describe Trip, :type => :model do

  context "associations" do
    it { should belong_to(:user) }
    it { should have_many(:flights) }
  end

  context "validations" do
    it { should validate_presence_of(:origin_city) }
    it { should validate_presence_of(:origin_country) }
    it { should validate_presence_of(:destination_city) }
    it { should validate_presence_of(:destination_country) }
    it { should validate_presence_of(:timespan) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
  end
end
