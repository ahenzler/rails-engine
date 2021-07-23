FactoryBot.define do
  factory :invoice do
    status { %w[Shipped Pending Canceled].sample }
  end
end
