class Merchant < ApplicationRecord
  has_many :items

  validates :name, presence: true

  self.per_page = 20
end