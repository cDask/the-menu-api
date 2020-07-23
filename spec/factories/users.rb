FactoryBot.define do
  
  factory :user do
    sequence :email do |n| 
      "#{n}factory@user.com"
    end
    password  { "password" }
    full_name { "Factory User" }
  end

  factory :restaurant do
    sequence :name do |n| 
       "#{n} Test Name"
    end
    opening_hours { "{}" }
    user
  end

  factory :menu do
    title { "Main menu" }
    restaurant
  end
  
  trait :existing do
      email { "test@user.com"}
      password { "password" }
  end

  trait :invalid do
      email { nil }
  end

  trait :invalid_title do
    title { nil }
  end

  trait :invalid_name do
    name { nil }
  end

end

def user_with_restaurants(restaurant_count: 2)
  FactoryBot.create(:user) do |user|
    FactoryBot.create_list(:restaurant, restaurant_count, user: user)
  end
end

