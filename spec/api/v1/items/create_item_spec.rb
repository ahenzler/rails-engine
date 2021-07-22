require 'rails_helper'

RSpec.describe 'items' do
  describe 'item#create' do
    it 'can create a item' do
      merchant1 = create(:merchant)

      post '/api/v1/items', params: {name: 'item name', describtion: 'item description', unit_price: '10.00', merchant_id: merchant1.id}

      expect(response).to be_successful

      item = JSON.parse(response.body, symbolize_names: true)

      expect(item).to be_a(Hash)
      expect(item).to have_key(:data)
      expect(item[:data]).to be_a(Hash)
      expect(item[:data]).to have_key(:id)
      expect(item[:data].count).to eq(3)
      expect(item[:data]).to have_key(:attributes)
      expect(item[:data][:attributes]).to be_a(Hash)
    end
  end
end
