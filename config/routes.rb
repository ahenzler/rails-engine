Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'merchants/find', to: 'merchants/merchants_search#search'
      get 'merchants/most_items', to: 'merchants/most_items#most_items'
      get 'items/find_all', to: 'items/items_search#search'

      resources :merchants, only: %i[index show]
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
