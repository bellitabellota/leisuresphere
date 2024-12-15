FactoryBot.define do
  factory :post do
    body { "MyText" }
    association :author, factory: :user
  end
end
