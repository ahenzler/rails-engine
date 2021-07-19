FactoryBot.define do
  factory :transaction do
    credit_card_number { Faker::Buisness.credit_card_number }
    credit_card_expiration_date { Faker::Buisness.credit_card_expiration_date }
    result { Faker::Status.transaction_status(success, failure) }
  end
end