FactoryBot.define do
  factory :image_post do
    association :author, factory: :user
  end
end
