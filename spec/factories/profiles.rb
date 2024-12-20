FactoryBot.define do
  factory :profile do
    association :user, factory: :user
    birthday { "2024-12-19" }
    location { "MyLocation" }
    interests { "MyInterests" }
    avatar_url { "MyAvatar" }
  end
end
