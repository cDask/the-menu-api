FactoryBot.define do
  factory :restaurant do
    sequence :name do |n| 
       "#{n} Test Name"
    end
    opening_hours { "{}" }
    user
  end

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

def user_with_restaurants(restaurant_count: 2)
  FactoryBot.create(:user) do |user|
    FactoryBot.create_list(:restaurant, restaurant_count, user: user)
  end
end