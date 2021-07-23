require 'rails_helper'

RSpec.describe 'items merchant' do
  describe 'index' do
    it 'can get an items merchant' do
      merchant = create(:merchant)
      item = create(:item, merchant: merchant)

      get "/api/v1/items/#{item.id}/merchant"

      expect(response).to be_successful

      item_merchant = JSON.parse(response.body, symbolize_names: true)

      expect(item_merchant).to be_a(Hash)
      expect(item_merchant).to have_key(:data)
      expect(item_merchant[:data]).to be_a(Hash)
      expect(item_merchant[:data]).to have_key(:id)
      expect(item_merchant[:data][:id]).to eq("#{merchant.id}")
      expect(item_merchant[:data]).to have_key(:type)
      expect(item_merchant[:data][:type]).to eq('merchant')
      expect(item_merchant[:data]).to have_key(:attributes)
      expect(item_merchant[:data][:attributes]).to be_a(Hash)
    end
  end
end