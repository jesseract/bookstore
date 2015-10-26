Rails.application.routes.draw do
  resources :orders
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  resources :line_items
  resources :carts
  resources :books

  root 'books#index'
end
