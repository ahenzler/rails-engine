FactoryBot.define do
  factory :item do
    name { Faker::Movies::HarryPotter.spell }
    description { Faker::HarryPotter.quote }
    unit_price { Faker::Number.number.decimal(l_digits:2) }
  end
end