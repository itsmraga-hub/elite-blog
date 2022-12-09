Rails.application.routes.draw do
  devise_for :users
  # get 'likes/create'
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end

  resources :users, only: [] do
    member do
      get 'api_token'
    end
  end
  # API routes
  namespace :api do
    namespace :v1 do
      # post 'auth/login', to 'authenticate#login'
      resources :users do 
        resources :posts do 
          resources :comments
          resources :likes
        end
      end
    end
  end
    
  # Defines the root path route ("/")
  # root "users#index"
end
