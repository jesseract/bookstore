Rails.application.routes.draw do
  resources :line_items
  resources :line_items
  resources :carts
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :books
  devise_for :users

  root 'books#index'
end
