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

    it 'has only one merchants items listed' do
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      create_list(:item, 51, merchant: merchant1)
      create_list(:item, 53, merchant: merchant2)

      get api_v1_merchant_items_path(merchant1.id)
      expect(response).to be_successful

      items = JSON.parse(response.body)
      expect(items.count).to be <= 20

      get api_v1_merchant_items_path(merchant1.id, page: 2)
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

  describe 'item#update' do
    it 'can update a item' do
      merchant1 = create(:merchant)
      item1 = create(:item, merchant: merchant1)

      old_name = item1.name

      item_params = { name: 'new_name' }

      put "/api/v1/items/#{item1.id}", params: JSON.generate({item: item_params})

      new_item = Item.find(item1.id)

      expect(response).to be_successful
      expect(new_item.name).to eq(item_params[:name])
      expect(new_item.name).not_to eq(old_name)
    end
  end

  describe 'item#create' do
    it 'can create a item' do
      merchant1 = create(:merchant)
      expect(merchant1.items.count).to be == 0

      item_params = ({
                name: 'item name',
                describtion: 'item description',
                unit_price: '10.00',
                merchant_id: merchant1.id
              })

      post '/api/v1/items', params: JSON.generate({item: item_params})

      expect(response).to be_successful
      expect(merchant1.items.count).to be == 1
      expect(merchant1.items.first.name).to eq("item1")
      expect(merchant1.items.first.description).to eq("this is a item")
      expect(merchant1.items.first.unit_price).to eq(11.11)
      expect(merchant1.items.first.merchant_id).to eq(merchant1.id)
    end
  end

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
