FactoryBot.define do
  factory :buyer_order do
    token          {"tok_abcdefghijk0000000000"}
    postal_code    { "123-1234" }
    prefecture_id  { Faker::Number.between(from: 2, to: 48) }
    municipalities { Faker::Lorem.sentence }
    address        { Faker::Lorem.sentence }
    building       { Faker::Lorem.sentence }
    tell           { "09012341234" }
  end
end
