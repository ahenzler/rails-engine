require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to(:merchant)}
    it { should have_many :invoice_items}
    it { should have_many(:invoices).through(:invoice_items) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:unit_price) }
  end

  describe 'methods' do
    it 'can find items by name' do
      merchant = create(:merchant)
      item1 = create(:item, name: 'item1', merchant: merchant)
      item2 = create(:item, name: 'item2', merchant: merchant)
      item3 = create(:item, name: 'item3', merchant: merchant)
      item4 = create(:item, name: 'item4', merchant: merchant)

      expect(Item.find_all("item1")).to eq([item1])
      expect(Item.find_all("it")).to eq([item1, item2, item3, item4])
    end
  end
end
