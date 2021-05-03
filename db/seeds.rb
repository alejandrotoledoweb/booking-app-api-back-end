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

Engineer.create(
  name: 'Mexican Site',
  description: 'Burritos nad mexican food',
  location: 'Ontario',
  avatar_link: 'https://robohash.org/sitsequiquia.png?size=300x300&set=set1'
)