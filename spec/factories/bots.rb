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
    subdomain { "testname" }
    user
  end

  factory :menu do
    title { "Main menu" }
    restaurant
  end

  factory :contact_info do
    name { "Location" }
    info_type { 'link' }
    info { "google.com" }
    restaurant
  end

  factory :item do
    name { "Item" }
    description { "This is an item" }
    menu
  end

  factory :tag do
    name { "Vegetarian "}
  end

  factory :ingredient do
    name { "Banana" }
    item
  end

  factory :size do
    name { "Glass" }
    price { 1000 }
    item
  end

  factory :theme do
    theme_class { "minimal" }
    themeable { association :item }
  end

  factory :style do
    style_data { "{ background: '#FFFFFF' }" }
    styleable { association :item }
  end

  trait :invalid_theme_class do
    theme_class { nil }
  end

  trait :invalid_style_data do
    style_data { nil }
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

