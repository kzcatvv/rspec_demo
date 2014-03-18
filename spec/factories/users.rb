# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "user@gmail.com"
    password "password"
    admin false

    factory :admin do
    	admin true
    end
  end
end
