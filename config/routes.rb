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

  # Defines the root path route ("/")
  # root "users#index"
end
