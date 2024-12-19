FactoryBot.define do
  factory :profile do
    user { nil }
    birthday { "2024-12-19" }
    location { "MyString" }
    interests { "MyText" }
    avatar_url { "MyString" }
  end
end
