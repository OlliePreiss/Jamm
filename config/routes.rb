Rails.application.routes.draw do
  get 'user_/genres'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users

  get "users/:id/onboarding_genre", to: "users#edit", as: :edit_restaurant
  get "users/:id/onboarding_instrument", to: "users#edit", as: :edit_restaurant
  get "users/:id/onboarding_ability", to: "users#edit", as: :edit_restaurant
  get "users/:id/onboarding_commitment", to: "users#edit", as: :edit_restaurant
  get "users/:id/onboarding_about", to: "users#edit", as: :edit_restaurant


  resources :genres, only: [:index]
  resources :user_genres, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :instruments, only: [:index]
  resources :user_instruments, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :matches, only: [:index]
  resources :conversations, only: [:show] do
    resources :messages
  end
end
