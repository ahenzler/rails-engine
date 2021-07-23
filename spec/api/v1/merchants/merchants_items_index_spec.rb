require 'rails_helper'

RSpec.describe 'merchants_items' do
  describe 'index' do
    it 'can get all of a merchants items' do
      merchant = create(:merchant)
      items = create_list(:item, 3, merchant: merchant)

      get "/api/v1/merchants/#{merchant.id}/items"

      expect(response).to be_successful

      merchant_items = JSON.parse(response.body, symbolize_names: true)

      expect(merchant_items).to be_a(Hash)
      expect(merchant_items).to have_key(:data)
      expect(merchant_items[:data]).to be_a(Array)
      expect(merchant_items[:data].size).to eq(3)
      expect(merchant_items[:data].first).to have_key(:attributes)
      expect(merchant_items[:data].first[:attributes]).to have_key(:name)
      expect(merchant_items[:data].first[:attributes]).to have_key(:description)
      expect(merchant_items[:data].first[:attributes]).to have_key(:unit_price)
    end
  end
end
