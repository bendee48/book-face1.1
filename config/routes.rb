Rails.application.routes.draw do
  get 'comments/create'
  root 'posts#index'
  devise_for :users, controllers: { omniauth_callbacks: 'user/omniauth_callbacks', registrations: 'users/registrations' }
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :create, :destroy]
  end
  resources :likes, only: [:create]
  resources :comments, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  resources :friend_requests, only: [:create, :index, :destroy]
end
