Rails.application.routes.draw do
  root 'home#index'
  resources :items 
  resources :orders, only: [:index, :show, :create]
  resources :carts, path: "mon_panier"
  resources :cart_items, only: [:create,:destroy]
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
