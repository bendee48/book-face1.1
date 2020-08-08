FactoryBot.define do
  factory :friend_request do
    id { 1 }
    association :request_user, factory: :user
  end
end