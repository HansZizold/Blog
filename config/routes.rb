Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'users#index'

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new create show destroy] do
      resources :comments, only: %i[create destroy]
      resources :likes, only: [:create]
    end
  end
end
