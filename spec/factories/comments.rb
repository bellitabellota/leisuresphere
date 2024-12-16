FactoryBot.define do
  factory :comment do
    body { "MyText" }
    post { nil }
    commenter { nil }
  end
end
