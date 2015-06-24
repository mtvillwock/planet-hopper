require 'rails_helper'

RSpec.describe Airport, :type => :model do
context "associations" do
    it { should have_one :flight }
  end
  context 'validations' do
  end
end
