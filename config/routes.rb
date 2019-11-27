Rails.application.routes.draw do
  root 'home#index'
  get 'team', to: "home#team"
  get 'contact', to: "home#contact"
  resources :items 
  resources :orders, only: [:index, :show, :create]
  resources :cart_items, only: [:create,:destroy]

  resources :carts, only: [:index, :create, :update, :show, :destroy], path: "mon_panier"

  # get '/mon_panier', to: 'carts#show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
