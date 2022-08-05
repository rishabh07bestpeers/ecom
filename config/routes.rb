Rails.application.routes.draw do
  devise_for :users
  root "dashboards#index"
  resources :sellers
  resources :buyers
  get "/search", to: "buyers#search"

  resources :carts
  resources :orders
  resources :order_details
  resources :wishlists
  resources :hidelists

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
