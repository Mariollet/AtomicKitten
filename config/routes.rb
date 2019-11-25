Rails.application.routes.draw do
  root 'home#index'
  resources :items 
  resources :orders, only: [:index, :show, :create]
  resources :carts, path: "mon_panier"
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
