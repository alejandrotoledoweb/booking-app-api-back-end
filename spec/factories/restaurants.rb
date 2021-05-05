FactoryBot.define do
  factory :restaurant do
    name { Faker::Restaurant.unique.name }
    description { Faker::Restaurant.unique.type }
    location { Faker::Address.unique.street_address }
    avatar_link { 'https://picsum.photos/200/300?random=1' }
  end
end
