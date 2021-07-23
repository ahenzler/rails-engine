class Item < ApplicationRecord
  belongs_to :merchant

  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true

  self.per_page = 20

  def self.item_merchant(item_id)
    find(item_id).merchant
  end

  def self.find_all(item_name)
    where('name iLIKE :search', search: "%#{item_name}%")
      .order(:name)
  end
end
