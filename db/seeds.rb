# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# users

j = User.find_by(name: "John") || User.create(name: "John", email: "john@mail.com", password: "johnjohn")
a = User.find_by(name: "Alice") || User.create(name: "Alice", email: "alice@mail.com", password: "alicealice")
b = User.find_by(name: "Bruce") || User.create(name: "Bruce", email: "bruce@mail.com", password: "brucebruce")
s = User.find_by(name: "Suzanne") || User.create(name: "Suzanne", email: "suzanne@mail.com", password: "suzannesuzanne")
v = User.find_by(name: "Vincente") || User.create(name: "Vincente", email: "vincente@mail.com", password: "vincentevincente")

# attaching profile pictures

j.profile.update(birthday: "1985-01-22", location: "Kyoto", interests: "Hockey, Cards, Outdoor-Sport, Action Movies, Shuff...")
j.profile.profile_picture.attach(io: File.open('app/assets/images/seed/red_cat.jpg'), filename: "red_cat.jpg")

a.profile.update(birthday: "1977-01-22", location: "Wonderland", interests: "Daydreaming, Indulging in Fantasies, Dancing in Flower Meadows")
a.profile.profile_picture.attach(io: File.open('app/assets/images/seed/sunflower.jpg'), filename: "sunflower.jpg")

b.profile.update(birthday: "1983-01-22", location: "Birmingham", interests: "Boxing, Painting, Skating, Sleeping")
b.profile.profile_picture.attach(io: File.open('app/assets/images/seed/car.jpg'), filename: "car.jpg")

s.profile.update(birthday: "1994-01-22", location: "South California", interests: "Sun, Surfing, Travelling, Adventures")
s.profile.profile_picture.attach(io: File.open('app/assets/images/seed/wave.jpg'), filename: "wave.jpg")

# posts, image_posts and comments

s.posts.find_or_create_by!(body: "Here are Suzanne's highlights of the day: A walk through the lush green of the nearby forest, a healthy breakfast ...")

a_image_post = a.image_posts.build
a_image_post.body.attach(io: File.open('app/assets/images/seed/apnoe.jpg'), filename: "apnoe.jpg")
a_image_post.save

s_comment = a_image_post.comments.build(body: "A wonderful picture", commenter_id: s.id)
s_comment.save
v_comment = a_image_post.comments.build(body: "How clear the water is!", commenter_id: v.id)
v_comment.save

b_post = b.posts.find_or_create_by!(body: "Bruce has special plans for this week. He is gonna try something new. He's decided to take up painting, a hobby he's always been curious about. With a canvas and brushes ready, he's excited to see where his creativity will take him. This week promises to be an adventure of colors and imagination.")
j_comment = b_post.comments.build(body: "I would love to see what you create!", commenter_id: j.id)
j_comment.save

s_image_post = s.image_posts.build
s_image_post.body.attach(io: File.open('app/assets/images/seed/culinary_experience.jpg'), filename: "culinary_experience.jpg")
s_image_post.save

b_comment = s_image_post.comments.build(body: "Would you share were this peaceful place is?", commenter_id: b.id)
b_comment.save

a.posts.find_or_create_by!(body: "Alice has to be careful to not fall into the rabbit hole. The path ahead is filled with unexpected twists and turns. She must stay alert and trust her instincts to navigate through the unknown.")
j.posts.find_or_create_by!(body: "The origin of the name John is in contrast to what one may assume quite pecuiliar. It traces back to ancient Hebrew, where it means 'graced by God.' Over centuries, it has evolved and been adopted by various cultures, each adding its unique touch.")

j_image_post = j.image_posts.build
j_image_post.body.attach(io: File.open('app/assets/images/seed/plant.jpg'), filename: "plant.jpg")
j_image_post.save

s_comment_2 = j_image_post.comments.build(body: "That lush green rembembers me that when I get back home I really have to do some gardening.", commenter_id: s.id)
s_comment_2.save

b_image_post = b.image_posts.build
b_image_post.body.attach(io: File.open('app/assets/images/seed/siam_cat.jpg'), filename: "siam_cat.jpg")
b_image_post.save

a_comment = b_image_post.comments.build(body: "Such a cute cat. I have three at home :)", commenter_id: a.id)
a_comment.save
