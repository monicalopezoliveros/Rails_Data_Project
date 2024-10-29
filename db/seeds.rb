# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Delete existing data to avoid duplicates.
User.destroy_all
Car.destroy_all
Rental.destroy_all

# Create users
210.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 6)
  )
end

# Create cars
215.times do
  Car.create!(
    brand: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    year: Faker::Vehicle.year,
    price_per_day: Faker::Commerce.price(range: 20..100.0, as_string: true)
  )
end

# Create rentals
200.times do
  Rental.create!(
    user_id: User.pluck(:id).sample, # Select a random user ID
    car_id: Car.pluck(:id).sample, # Select a random car ID
    start_date: Faker::Date.between(from: Date.today, to: 30.days.from_now),
    end_date: Faker::Date.between(from: 31.days.from_now, to: 60.days.from_now)
  )
end
puts " #{User.count} users, #{Car.count} cars, and #{Rental.count} rentals have been created."
