FactoryBot.define do
  factory :image_post do
    association :author, factory: :user

    after(:build) do |image_post|
      image_post.body.attach(
        io: File.open(Rails.root.join("spec/support/assets/test_image_post_sunset.jpg")),
        filename: "test_image_post_sunset.jpg",
        content_type: "jpg"
      )
    end
  end
end
