require 'rails_helper'

RSpec.describe Airport, :type => :model do
  context "associations" do
    it { should belong_to(:city) }
    it { should have_many(:routes).with_foreign_key('origin_airport_id') }
    it { should have_many(:routes).with_foreign_key('destination_airport_id') }
    it { should have_many(:flights).through(:routes) }
    it { should belong_to(:city) }
  end
  context 'validations' do
  end
end
