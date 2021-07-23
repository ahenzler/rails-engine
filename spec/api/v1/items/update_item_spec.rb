require 'rails_helper'

RSpec.describe 'items' do
  describe 'item#update' do
    it 'can update a item' do
      merchant1 = create(:merchant)
      item1 = create(:item, merchant: merchant1)

      old_name = item1.name

      put "/api/v1/items/#{item1.id}", params: {name: 'new name'}

      expect(response).to be_successful

      new_item = Item.find(item1.id)

      expect(new_item.name).to eq('new name')
      expect(new_item.name).not_to eq(old_name)
    end
  end
end