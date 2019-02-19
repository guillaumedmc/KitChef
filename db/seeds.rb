# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

Product.destroy_all
User.destroy_all

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 'azerty',
    first_name: Faker::Name.name,
    last_name: Faker::Name.name,
    address: Faker::Address.full_address,
    chef: true
    )
    user.save!
    3.times do
      min_cover = rand(2..5)
      max_cover = rand(6..30)
      product = Product.new(
        name: Faker::Food.dish,
        user_id: user.id,
        description: Faker::Food.description,
        price: rand(10..30),
        category: Faker::Restaurant.type,
        min_cover: min_cover,
        max_cover: max_cover
        )
      product.save!
    end
end

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 'azerty',
    first_name: Faker::Name.name,
    last_name: Faker::Name.name,
    address: Faker::Address.full_address,
    chef: false
    )
  user.save!
end

