Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'users#index'

  resources :users do
    resources :posts do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[new create]
    end
  end
end
