# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


j = User.find_by(name: "John") || User.create(name: "John", email: "john@mail.com", password: "johnjohn")
a = User.find_by(name: "Alice") || User.create(name: "Alice", email: "alice@mail.com", password: "alicealice")
b = User.find_by(name: "Bruce") || User.create(name: "Bruce", email: "bruce@mail.com", password: "brucebruce")
s = User.find_by(name: "Suzanne") || User.create(name: "Suzanne", email: "suzanne@mail.com", password: "suzannesuzanne")
v = User.find_by(name: "Vincente") || User.create(name: "Vincente", email: "vincente@mail.com", password: "vincentevincente")

v.posts.find_or_create_by!(body: "This is Vincente's first post.")
v.posts.find_or_create_by!(body: "This is Vincente's second post.")
s.posts.find_or_create_by!(body: "Here are Suzanne's highlights of the day.")
b.posts.find_or_create_by!(body: "Bruce has special plans for this week. He is gonna try something new.")
a.posts.find_or_create_by!(body: "Alice has to be careful to not fall into the rabbit hole.")
j.posts.find_or_create_by!(body: "The origin of the name John is in contrast to what one may assume quite pecuiliar.")
