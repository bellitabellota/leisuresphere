# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


User.create(name: "John", email: "john@mail.com", password: "johnjohn")
User.create(name: "Alice", email: "alice@mail.com", password: "alicealice")
User.create(name: "Bruce", email: "bruce@mail.com", password: "brucebruce")
User.create(name: "Suzanne", email: "suzanne@mail.com", password: "suzannesuzanne")
User.create(name: "Vincente", email: "vincente@mail.com", password: "vincentevincente")
