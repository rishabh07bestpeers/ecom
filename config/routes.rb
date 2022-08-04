Rails.application.routes.draw do
  devise_for :users
  root "dashboards#index"
  resources :sellers
  resources :buyers
  resources :carts
  resources :orders
  resources :order_details

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
