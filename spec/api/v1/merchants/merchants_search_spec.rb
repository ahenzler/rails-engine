require 'rails_helper'

RSpec.describe 'merchants' do
  describe 'search' do
    it 'returns the correct merchant' do
      create(:merchant, name: 'merchant1')
      create(:merchant, name: 'merchant2')

      get api_merchants_path, params: { name: 'merchant1' }

      expect(response).to be_successful

      merchant_found = JSON.parse(response.body, symbolize_names: true)

      expect(merchant_found).to be_a(Hash)
      expect(merchant_found).to have_key(:data)
      expect(merchant_found[:data]).to be_a(Hash)
      expect(merchant_found[:data]).to have_key(:attributes)
      expect(merchant_found[:data][:attributes]).to have_key(:name)
      expect(merchant_found[:data][:attributes][:name]).to eq('merchant1')
    end
  end
end
