class Api::V1::ItemsController < ApplicationController

  def find_item
    Item.find(params[:id])
  end

  def index
    if params[:page].to_i >= 1
      items = Item.paginate(page: params[:page], per_page: params[:per_page])
    else
      items = Item.paginate(page: "1", per_page: params[:per_page])
    end
    render json: (ItemSerializer.new(items)).serializable_hash
  end

  def show
    render json: (ItemSerializer.new(find_item)).serializable_hash
  end

  def update
    if find_item.update(item_params)
      render json: (ItemSerializer.new(find_item)).serializable_hash, status: :ok
    else
      render json: {errors: find_item.errors}, status: :unprocessable_entity
    end
  end

  def create
    item = Item.create!(item_params)
    if item.save
      render json: ItemSerializer.new(item).serializable_hash, status: :created
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    find_item.destroy
  end

  private

  def item_params
    params.permit(:name, :description, :unit_price, :merchant_id)
  end
end