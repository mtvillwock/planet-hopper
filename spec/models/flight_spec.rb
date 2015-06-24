require 'rails_helper'

RSpec.describe Flight, :type => :model do
  context "associations" do
    it { should belong_to :trip }
    it { should have_one :destination }
    it { should have_one :origin }
  end
  context 'validations' do
  end
end
