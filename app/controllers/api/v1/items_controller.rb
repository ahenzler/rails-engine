class Api::V1::ItemsController < ApplicationController
  def index
    if params[:page].to_i >= 1
      items = Item.paginate(page: params[:page], per_page: params[:per_page])
    else
      items = Item.paginate(page: "1", per_page: params[:per_page])
    end
    render json: (ItemSerializer.new(items)).serializable_hash
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end
end