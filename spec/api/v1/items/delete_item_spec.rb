require 'rails_helper'

RSpec.describe 'items' do
  describe 'item#destroy' do
    it 'can destroy a item' do
      merchant1 = create(:merchant)
      item1 = create(:item, merchant: merchant1)
      expect(merchant1.items.count).to be == 1

      delete "/api/v1/items/#{item1.id}"

      expect(response).to be_successful
      expect(merchant1.items.count).to be == 0
      expect(Item.find_by(id: item1.id)).to be nil
    end
  end
end
