require 'rails_helper'

RSpec.describe Route, :type => :model do
  context "associations" do
    it { should belong_to(:flight) }
    it { should belong_to(:destination_airport).class_name('Airport') }
    it { should belong_to(:origin_airport).class_name('Airport') }
  end
end
