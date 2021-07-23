class Item < ApplicationRecord
  belongs_to :merchant

  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true

  self.per_page = 20

  def self.item_merchant(item_id)
    find(item_id).merchant
  end
end