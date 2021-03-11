FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    text { Faker::Lorem.sentence }
    category_id { Faker::Number.within(range: 2..12) }
    status_id { Faker::Number.within(range: 2..7) }
    pay_id { Faker::Number.within(range: 2..3) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    delivery_date_id { Faker::Number.within(range: 2..4) }
    price { Faker::Number.within(range: 300..9_999_999) }
  end
end
