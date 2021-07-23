require 'rails_helper'

RSpec.describe 'items' do
  describe 'item#show' do
    it 'can get one item' do
      merchant1 = create(:merchant)
      item1 = create(:item, merchant: merchant1)

      get "/api/v1/items/#{item1.id}"

      expect(response).to be_successful

      item = JSON.parse(response.body, symbolize_names: true)

      expect(item).to be_a(Hash)
      expect(item).to have_key(:data)
      expect(item[:data]).to be_a(Hash)
      expect(item[:data]).to have_key(:attributes)
    end
  end
end
