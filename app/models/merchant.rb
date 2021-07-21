class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  # has_many :NAME, through: :NAME

  validates :name, presence: true
end