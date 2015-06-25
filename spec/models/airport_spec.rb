require 'rails_helper'

RSpec.describe Airport, :type => :model do
  context "associations" do
    it { should belong_to(:city) }
    it { should have_one(:route) }
    it { should have_one(:flight).through(:route) }
  end
  context 'validations' do
  end
end
