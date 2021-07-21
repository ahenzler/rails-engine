require 'rails_helper'

RSpec.describe 'merchants api' do
  before :each do
    get api_v1_merchants_path
  end

  describe 'index' do
    it 'can list 20 merchants' do
      create_list(:merchant, 20)
      require 'pry'; binding.pry
      expect(response).to be_successful

      merchants = JSON.parse(response.body)
      expect(merchants.size).to be <= 20
    end
  end
end