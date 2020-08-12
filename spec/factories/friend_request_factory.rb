FactoryBot.define do
  factory :friend_request do
    id { rand(1..100) }
    association :request_user, factory: :user
  end
end