# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating database"
Restaurant.destroy_all

puts 'Creating 10 Restaurants'

10.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: ['chinese', 'italian', 'japanese', 'french', 'belgian'].sample
  )
  restaurant.save!
end

puts 'Creating 100 Reviews'
10.times do
  restaurant_id = Restaurant.first.id
  10.times do
    review = Review.new(
      content: Faker::Restaurant.review,
      rating: rand(6),
      restaurant: Restaurant.find(restaurant_id)
    )
    review.save!
  end
  restaurant_id += 1
end
