require 'rails_helper'

RSpec.describe 'item_search' do
  describe 'search' do
    it 'can search for all items with a name' do
    merchant = create(:merchant)
    item1 = create(:item, name: 'Gatorade2', merchant: merchant)
    item2 = create(:item, name: 'Apple', merchant: merchant)
    item3 = create(:item, name: 'GatoradeZero', merchant: merchant)

    get '/api/v1/items/find_all?name=gatorade'

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items).to be_a(Hash)
    end

    it 'will return objevt without name' do

      get '/api/v1/items/find_all'

      expect(response).to be_successful
      expect(response.status).to eq(200)

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items).to be_a Hash
    end
  end
end
