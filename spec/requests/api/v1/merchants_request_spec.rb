require 'rails_helper'

RSpec.describe 'merchants' do

  describe 'merchant#index' do
    it 'each page lists 20 merchants' do
      create_list(:merchant, 45)
      get api_v1_merchants_path
      expect(response).to be_successful

      merchants = JSON.parse(response.body)
      expect(merchants.count).to be <= 20

      get api_v1_merchants_path(page: 2)
      expect(merchants.count).to be <= 20
    end
  end

  describe 'merchant#show' do
    it 'can get one merchant' do
      merchant1 = create(:merchant)
      get api_v1_merchant_path(id: merchant1.id)
      expect(response).to be_successful

      merchant = JSON.parse(response.body)
      expect(merchant["data"]["id"]).to eq merchant1.id.to_s
      expect(merchant["data"]["attributes"]["name"]).to eq merchant1.name
      expect(merchant.count).to be == 1
    end
  end
end
