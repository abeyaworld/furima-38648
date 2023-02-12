FactoryBot.define do
  factory :order_address do
    post_num { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    item_prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipality { Faker::Address.city }
    house_num  { Faker::Address.street_address }
    building { Faker::Address.street_address }
    phone_num { Faker::Number.decimal_part(digits: 11) }
    token { Faker::Internet.password(min_length: 20) }
  end
end
