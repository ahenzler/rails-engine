require 'rails_helper'

RSpec.describe 'items' do
  describe 'index' do
    it 'each page lists 20 items' do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      create_list(:item, 51, merchant: merchant1)
      create_list(:item, 53, merchant: merchant2)

      get '/api/v1/items'

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items).to be_a(Hash)
      expect(items[:data]).to be_an(Array)
      expect(items[:data].size).to eq(20)
      expect(items[:data].first).to have_key(:attributes)
      expect(items[:data].first[:attributes]).to be_a(Hash)

    end
  end
end
