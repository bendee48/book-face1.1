FactoryBot.define do
  factory :friendship do
    association :friend, factory: :user
    association :friend_of, factory: :user
  end
end
