require 'rails_helper'

RSpec.describe 'merchants' do
  describe 'most_items' do
    it 'can find merchant that sold most items' do
      customer = create(:customer, first_name: 'John', last_name: 'Doe')
      merchant1 = create(:merchant)
      merchant2 = create(:merchant)
      invoice1 = create(:invoice, merchant_id: merchant1, customer: customer)
      invoice2 = create(:invoice, merchant_id: merchant2, customer: customer)
      item1 = create(:item, merchant: merchant1)
      item2 = create(:item, merchant: merchant2)

      transaction1 = create(:transaction, invoice: invoice1, result: 'success')
      transaction2 = create(:transaction, invoice: invoice2, result: 'success')

      create(:invoice_item, invoice: invoice1, item: item1)
      create(:invoice_item, invoice: invoice1, item: item1)

      create(:invoice_item, invoice: invoice2, item: item2)

      get 'api/v1/merchants/most_items?quantity=2'

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants).to be_a(Hash)
      expect(merchants[:data]).to be_a(Array)
      expect(merchants[:data].size).to eq(1)
      expect(merchants[:data].first).to be_a(Hash)
      expect(merchants[:data].first[:id]).to eq(merchant1.id)
      expect(merchants[:data].first[:name]).to eq(merchant1.name)
    end
  end
end
