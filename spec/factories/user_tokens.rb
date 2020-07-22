FactoryBot.define do
    factory :user_token do
      email { User.last.email}
      password  { User.last.password }
    end
end