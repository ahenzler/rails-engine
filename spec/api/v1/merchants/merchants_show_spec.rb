require 'rails_helper'

RSpec.describe 'merchants' do
  describe 'show' do
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
