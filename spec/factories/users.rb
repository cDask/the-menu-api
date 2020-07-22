FactoryBot.define do
    factory :user do
      sequence :email do |n| 
        "#{n}factory@user.com"
        end
      password  { "password" }
      full_name { "Factory User" }
    end
    trait :existing do
        email { "test@user.com"}
        password { "password" }
    end
    trait :invalid do
        email { nil }
    end
end