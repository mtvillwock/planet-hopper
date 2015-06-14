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
      end
      factory :user_without_password do
        email "joe@example.com"
      end
    end
  end
end
