FactoryBot.define do
  factory :invoice do
    status {["Shipped", "Pending", "Canceled"].sample}
  end
end