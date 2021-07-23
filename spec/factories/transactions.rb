FactoryBot.define do
  factory :transaction do
    credit_card_number { Faker::Number.number(16) }
    credit_card_expiration_date { Faker::Date.between(to:1.year.ago, from:Date.today) }
    result { Faker::Status.transaction_status(success, failure) }
  end
end
