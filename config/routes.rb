Rails.application.routes.draw do

  resource :carts, only: [:show]
  resources :order_products, only: [:create, :update, :destroy]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { registrations: 'users/registrations' }


  get 'home/index'
  root 'home#index'

end
