require 'rails_helper'

RSpec.describe 'merchants' do
  describe 'index' do
    it 'each page lists 20 merchants' do
      create_list(:merchant, 45)
      get api_v1_merchants_path

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants).to be_a(Hash)
      expect(merchants[:data].length).to eq(20)
      expect(merchants[:data].first).to be_a(Hash)
      expect(merchants[:data].first).to have_key(:attributes)
      expect(merchants[:data].first[:attributes]).to be_a Hash
      expect(merchants[:data].first[:id]).to be_a(String)

      get api_v1_merchants_path(page: 2)
      expect(merchants.count).to be <= 20
    end
  end
end
