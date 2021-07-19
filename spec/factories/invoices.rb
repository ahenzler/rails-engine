FactoryBot.define do
  Factory :invoice do
    status {["Shipped", "Pending", "Canceled"].sample}
  end
end