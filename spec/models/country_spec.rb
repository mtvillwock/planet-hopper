require 'rails_helper'

RSpec.describe Country, :type => :model do
  context "associations" do
    it { should have_many(:cities) }
  end
end
