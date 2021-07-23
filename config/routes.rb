Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :merchants, only: [:index, :show]
      namespace :merchants do
        get '/:merchant_id/items', to: 'merchants_items#index'
      end

      resources :items
      namespace :items do
        get '/:item_id/merchant', to: 'items_merchant#index'
      end
    end
  end
end
