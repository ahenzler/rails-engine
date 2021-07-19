FactoryBot.define do
  factory :invoice_item do
    quantity {Faker::Number.between(1, 100)}
    unit_price { Faker::Number.number.decimal(l_digits:2) }
    result {["Paid", "Pending", "Failed"].sample}
  end
end