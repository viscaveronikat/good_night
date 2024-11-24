# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
users = {}
for a in 1..5 do
  users["id_#{a}"] = User.create!(name: Faker::Name.name)
  #fol = Follow.create(user_id: users["id_#{a-1}"].id, followed_user_id: users["id_#{a+1}"].id)
end

for a in 2..5 do
  Follow.create(user_id: users["id_#{a-1}"].id, followed_user_id: users["id_#{a+1}"].id) if a <= 4
end
