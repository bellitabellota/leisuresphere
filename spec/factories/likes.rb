FactoryBot.define do
  factory :like do
    association :liker, factory: :user
    association :likeable, factory: :post
  end
end
