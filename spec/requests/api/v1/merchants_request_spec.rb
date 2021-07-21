require 'rails_helper'

RSpec.describe 'merchants api' do
  describe 'index' do
    describe 'sends a list of merchants' do
      it 'has the correct path' do
        create_list(:merchant, 20)

        get api_v1_merchants_path
        expect(response).to be_successful

        merchants = JSON.parse(response.body)
      end
    end
  end
end