# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Restaurant.destroy_all

5.times do
  @restaurant = Restaurant.create!(
    name: Faker::Restaurant.unique.name, phone_number: Faker::PhoneNumber, address: Faker::Address.full_address, category: Restaurant::CATEGORIES.sample
  )
  5.times do
    Review.create(rating: rand(2..5), content: Faker::Lorem.paragraph(sentence_count: 3), restaurant: @restaurant)
  end
end
