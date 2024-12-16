FactoryBot.define do
  factory :comment do
    body { "MyComment" }
    association :post, factory: :post
    association :commenter, factory: :user
  end
end
