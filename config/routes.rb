Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post 'users/new', to: 'posts#create'
  post 'users/:user_id/posts/:id', to: 'comment#create', as: :comment
  post 'users/:user_id/posts/:id/likes', to: 'like#create', as: :like
  get 'users/:user_id/posts', to: 'posts#index', as: :posts
  get 'users/:user_id/posts/:id', to: 'posts#show', as: :post
  get 'users/', to: 'users#index'
  get 'users/new', to: 'posts#new', as: :new_post
  get 'users/:id', to: 'users#show', as: :user

  root to: "users#index"
end
