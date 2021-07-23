class Api::V1::Items::ItemsMerchantController < ApplicationController
  def index
    item_merchant = Item.item_merchant(params[:item_id])
    render json: MerchantSerializer.new(item_merchant).serializable_hash
  end
end