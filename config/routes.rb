Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #   get '/users', to: 'users#index'
  #   get '/users/:id', to: 'users#show'
  #   get '/users/:user_id/posts', to: 'user_posts#index'
  #   get '/users/:user_id/posts/:id', to: 'user_posts#show'

  root 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end
end
