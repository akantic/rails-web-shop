Rails.application.routes.draw do

  resource :carts, only: [:show]
  resources :order_products, only: [:create, :update, :destroy]
  resources :orders, only: [:new, :show, :update, :index]
  resources :products, only: [:show]
  resources :reviews, only: [:new, :create]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  get 'home/index'
  root 'home#index'

end
