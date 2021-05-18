FactoryBot.define do
  factory :appointment do
    user
    restaurant
    date { Faker::Date.in_date_period(year: 2021, month: 4) }
    duration { %i[15 30 45].sample }
    status { %i[booked unbooked].sample }
  end
end
