# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

# user = User.new(
#   email: Faker::Internet.email,
#   password: 'azerty',
#   first_name: Faker::Name.name,
#   last_name: Faker::Name.name,
#   address: Faker::Address.street_address,
#   chef: false
# )
# user.save!

# product = Product.new(
#   name: Faker::Food.dish,
#   user_id: user
#   )
# product.save!
User.destroy_all
Product.destroy_all

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 'azerty',
    first_name: Faker::Name.name,
    last_name: Faker::Name.name,
    address: Faker::Address.street_address,
    chef: false
    )
    user.save!
    5.times do
      product = Product.new(
        name: Faker::Food.dish,
        user_id: user.id
        )
      product.save!
    end
end
