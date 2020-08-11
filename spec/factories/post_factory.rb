FactoryBot.define do
  factory :post do
    body { "Lorem ipsum dolor sit amet, per doming evertitur complectitur eu." }
    association :user
  end
end