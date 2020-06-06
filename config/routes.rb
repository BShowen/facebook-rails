Rails.application.routes.draw do
  get 'site/index'
  devise_for :users 
  devise_scope :user do
    authenticated :user do
      root :to => 'site#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
