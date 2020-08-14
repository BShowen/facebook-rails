Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'static_pages#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :likes
  resources :friend_requests, only: [:create, :destroy, :index]
  resources :friendships, only: [:create, :destroy, :index]
  resources :posts
  resources :users, only: [:show, :index]
  get 'static_pages/index'
  
end
