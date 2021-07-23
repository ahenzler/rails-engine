class Invoice < ApplicationRecord
  validates :status, presence: true

  belongs_to :customer

  has_many :transactions, dependent: :destroy
  has_many :invoice_items
  has_many :items, through: :invoice_items
end
