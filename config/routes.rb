Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new]
  end
  post '/users/:user_id/posts/new', to: "posts#create", as: 'create_post'
  post '/users/:user_id/posts/:id/likes', to "likes#create", as: 'create_like'

  # Defines the root path route ("/")
  root "users#index"
end
