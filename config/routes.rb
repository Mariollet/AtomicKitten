Rails.application.routes.draw do
  root 'home#index'
  resources :items 
  resources :orders, only: [:index, :show, :create]
  resources :cart_items, only: [:create,:destroy]
  resources :carts, only: [:index, :edit, :create, :update], path: "mon_panier"
  # get '/mon_panier', to: 'carts#show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
