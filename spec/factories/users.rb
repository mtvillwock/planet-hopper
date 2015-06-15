require 'faker'
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    factory :valid_user do
      email Faker::Internet.email
      password Faker::Internet.password
      before(:save) { self.password = password }
    end
    factory :invalid_user do
      factory :user_without_email do
        email nil
        password Faker::Internet.password
        before(:save) { self.password = password }
      end
      factory :user_without_password do
        email "joe@example.com"
        password nil
      end
    end
  end
end
