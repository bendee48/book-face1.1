FactoryBot.define do
  factory :user do
    name { "John" }
    email { Faker::Internet.email }
    password { "password" }

    trait :invalid_name do
      name { nil }
    end
  end
end