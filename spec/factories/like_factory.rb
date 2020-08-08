FactoryBot.define do
  factory :like do
    id { 1 }
    association :user
    association :likeable, factory: :post
    likeable_type { 'Post' }
  end
end