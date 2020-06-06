Rails.application.routes.draw do
 resources :posts
  get 'users/index'
  get 'static_pages/index'
  devise_for :users 
  devise_scope :user do
    authenticated :user do
      root :to => 'static_pages#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
