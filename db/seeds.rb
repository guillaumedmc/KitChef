# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.new(name: "pif", )

product_attributes = [
  {
    name:         'Amazing Thai Food',
    description:      'xxxAAAxxx ',
    price:  25,
    category: "Asian",
  }
]

10.times do |product|
  Product.create!(product_attributes)
end
