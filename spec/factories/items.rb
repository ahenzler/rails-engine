FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    unit_price { Faker::Number.number.decimal(l_digits:2) }
  end
end