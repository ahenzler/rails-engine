Rails.application.routes.draw do
  namespace :admin do
    namespace :v1 do
      resources :merchants, only; [:index, :show]
      resources :merchants_items, only; [:index]
    end
  end
end