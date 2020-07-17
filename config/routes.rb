Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :users, only: [:index, :show]
  resources :friendships, only: [:create]
  resources :friend_requests, only: [:create]
end
