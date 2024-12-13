FactoryBot.define do
  factory :follow do
    association :followee, factory: :user
    association :follower, factory: :second_user
  end
end
