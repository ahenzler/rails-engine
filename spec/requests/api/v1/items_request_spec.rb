require 'rails_helper'

RSpec.describe 'items' do

  describe 'item#index' do
    xit 'each page lists 20 items' do
      create_list(:merchant, 45)
      get api_v1_items_path
      expect(response).to be_successful

      items = JSON.parse(response.body)
      expect(items.count).to be <= 20

      get api_v1_items_path(page: 2)
      expect(items.count).to be <= 20
    end
  end
end
