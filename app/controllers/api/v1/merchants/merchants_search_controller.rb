class Api::V1::Merchants::MerchantsSearchController < ApplicationController
  def search
    if params[:name] && params[:name].instance_of?(String)
      merchant = Merchant.find_merchant(params[:name])
      render json: MerchantSerializer.new(merchant).serializable_hash
    else
      render json: { errors: 'Please provide a valid name' }
    end
  end
end
