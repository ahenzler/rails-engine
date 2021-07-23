class Api::V1::Merchants::MostItemsController < ApplicationController
  def most_items
    merchants = Merchant.most_sold(params[:quantity])
    render json: ItemsSoldSerializer.new(merchants).serializable_hash
  end
end