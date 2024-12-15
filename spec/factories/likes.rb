FactoryBot.define do
  factory :like do
    association :liker, factory: :user
    association :liked_post, factory: :post
  end
end
