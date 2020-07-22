FactoryBot.define do
  factory :restaurant do
    sequence :name do |n| 
       "#{n} Test Name"
    end
    opening_hours { "{}" }
    user
  end
end