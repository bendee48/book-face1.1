FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.paragraph }
    commentable_type { 'Post' }
    association :commentable, factory: :post
    association :user
  end
end