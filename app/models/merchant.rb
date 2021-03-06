class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :name, presence: true

  self.per_page = 20

  def self.merchant_items(merchant_id)
    find(merchant_id).items
  end

  def self.find_merchant(merchant_name)
    where('name iLIKE :search', search: "%#{merchant_name}%")
      .order(:name)
      .limit(1)
      .first
  end

  def self.most_sold(quantity = 5)
    joins(items: { invoice_items: { invoice: :transactions } })
      .where('transactions.result = ?', 'success')
      .group(:id)
      .select('merchants.*, sum(invoice_items.quantity) as item_count')
      .limit(quantity)
      .order(item_count: :desc)
  end
end
