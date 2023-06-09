Rails.application.routes.draw do
  get 'user_/genres'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :genres, only: [:index]
  resources :user_genres, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :instruments, only: [:index]
  resources :user_instruments, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :matches, only: [:index]
  resources :conversations, only: [:index, :show] do
    resources :messages, only: [:create]
  end
end
