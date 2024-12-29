FactoryBot.define do
  factory :comment do
    body { "MyComment" }
    association :commentable, factory: :post
    association :commenter, factory: :user
  end
end
