require 'rails_helper'

RSpec.describe 'items' do
  describe 'item#index' do
    it 'each page lists 20 items' do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      create_list(:item, 51, merchant: merchant1)
      create_list(:item, 53, merchant: merchant2)

      get api_v1_items_path
      expect(response).to be_successful

      items = JSON.parse(response.body)
      expect(items.count).to be <= 20

      get api_v1_items_path(page: 2)
      expect(items.count).to be <= 20
    end
  end

    describe 'item#show' do
    it 'can get one item' do
      merchant1 = create(:merchant)
      item1 = create(:item, merchant: merchant1)
      get api_v1_item_path(id: item1.id)
      expect(response).to be_successful

      item = JSON.parse(response.body)
      expect(item["data"]["id"]).to eq item1.id.to_s
      expect(item["data"]["id"]).to eq item1.id.to_s
      expect(item["data"]["attributes"]["name"]).to eq item1.name
      expect(item["data"]["attributes"]["merchant_id"]).to eq merchant1.id
      expect(item.count).to be == 1
    end
  end
end
