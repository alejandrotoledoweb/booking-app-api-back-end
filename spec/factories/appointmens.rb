FactoryBot.define do
  factory :appointment do
    user_id { nil }
    restaurant_id { nil }
    date { Faker::Date.in_date_period(year: 2018, month: 2) }
    duration { %i[15 30 45].sample }
    status { %i[booked unbooked].sample }
  end
end