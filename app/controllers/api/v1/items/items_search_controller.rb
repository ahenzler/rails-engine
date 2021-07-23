class Api::V1::Items::ItemsSearchController < ApplicationController
  def search
    if params[:name] && params[:name].instance_of?(String)
      items = Item.find_all(params[:name])
      render json: ItemSerializer.new(items).serializable_hash
    else
      render json: { error: 'No name given' }
    end
  end
end
