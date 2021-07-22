class Api::V1::ItemsController < ApplicationController
  def index
    if params[:merchant_id]
      Merchant.find(params[:merchant_id])
      render json: ItemSerializer.new(Item.where(merchant_id: params[:merchant_id]))
    else
      if params[:page].to_i >= 1
        items = Item.paginate(page: params[:page], per_page: params[:per_page])
      else
        items = Item.paginate(page: "1", per_page: params[:per_page])
      end
      render json: (ItemSerializer.new(items)).serializable_hash
    end
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end

  def update
    render json: ItemSerializer.new(Item.find(params[:id]).update(item_params))
  end

  def create
    render json: ItemSerializer.new(Item.create!(item_params))
  end

  def destroy
    render json: ItemSerializer.new(Item.find(params[:id]).destroy)
  end

  private

  def item_params
    params.permit(:merchant_id, :name, :description, :unit_price)
  end
end