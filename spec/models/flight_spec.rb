require 'rails_helper'

RSpec.describe Flight, :type => :model do
  context "associations" do
    it { should belong_to(:trip) }
    it { should have_one(:route) }
    it { should have_one(:destination).class_name('Airport').through(:route) }
    it { should have_one(:origin).class_name('Airport').through(:route) }
  end
  context 'validations' do
  end
end
