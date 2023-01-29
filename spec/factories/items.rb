FactoryBot.define do
  factory :item do
    item_name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { Faker::Number.between(from: 2, to: 11) }
    condition_id  { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_id { Faker::Number.between(from: 2, to: 3) }
    item_prefecture_id { Faker::Number.between(from: 2, to: 48) }
    shipping_date_id { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
