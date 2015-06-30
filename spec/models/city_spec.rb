require 'rails_helper'

RSpec.describe City, :type => :model do
  context "associations" do
    it { should belong_to(:country) }
  end
end
