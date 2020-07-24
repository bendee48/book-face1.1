Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts
  end
  resources :friendships, only: [:create]
  resources :friend_requests, only: [:create, :index, :destroy]
end
