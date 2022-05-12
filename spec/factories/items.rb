FactoryBot.define do
  factory :item do
    name               { Faker::Name.name }
    text               { Faker::Lorem.sentence }
    price              { Faker::Number.between(from: 300, to: 9999999) }
    category_id        { Faker::Number.between(from: 2, to: 11) }
    condition_id       { Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id      { Faker::Number.between(from: 2, to: 48) }
    shipping_date_id   { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end

  end
end
