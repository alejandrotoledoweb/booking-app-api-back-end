# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  name: 'John Wick',
  username: 'johnwick',
  email: 'john@email.com',
  password: 'foobar',
  password_confirmation: 'foobar'
)

10.times do |e|
  Restaurant.create(
    name: Faker::Restaurant.unique.name,
    description: Faker::Restaurant.unique.type,
    location: Faker::Address.unique.street_address,
    avatar_link: "https://picsum.photos/200/300?random=#{e+1}"
  )
end
