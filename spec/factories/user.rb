FactoryBot.define do
  factory :user do
    name { Faker::Internet.unique.username }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
  end

  factory :second_user, class: "User" do
    name { Faker::Internet.unique.username }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
  end
end
