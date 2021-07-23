class Api::V1::MerchantsController < ApplicationController
  def index
    if params[:page].to_i >= 1
      merchants = Merchant.paginate(page: params[:page], per_page: params[:per_page])
    else
      merchants = Merchant.paginate(page: "1", per_page: params[:per_page])
    end
    render json: (MerchantSerializer.new(merchants)).serializable_hash
  end

  def show
    merchant = Merchant.find(params[:id])
    render json: MerchantSerializer.new(merchant).serializable_hash
  end
end