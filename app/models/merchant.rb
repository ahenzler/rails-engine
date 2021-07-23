class Merchant < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :name, presence: true

  self.per_page = 20

  def self.merchant_items(merchant_id)
    find(merchant_id).items
  end
end