Rails.application.routes.draw do
  get 'likes/create'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  # Defines the root path route ("/")
  root "users#index"
end
