Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # V3 - below routes are for creating individual pages for each question in profile creation

  # get "users/:id/genre", to: "onboardings#genre" < this is actually a user_genres_new
  # get "users/:id/instrument", to: "onboardings#instrument" < this is actually a user_instruments_new
  # get "users/:id/ability", to: "onboardings#ability", as: :onboarding_ability
  # get "users/:id/commitment", to: "onboardings#commitment",  as: :onboarding_commitment
  # get "users/:id/about", to: "onboardings#about", as: :onboarding_about
  # patch "users/:id", to: "onboardings#update"
  # patch "users/:id", to: "onboardings#update"
  # patch "users/:id", to: "onboardings#abilityupdate", as: :onboarding_ability_update
  # patch "users/:id", to: "onboardings#commitmentupdate", as: :onboarding_commitment_update
  # patch "users/:id", to: "onboardings#aboutupdate", as: :onboarding_about_update


  resources :genres, only: [:index]
  resources :user_genres, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :instruments, only: [:index]
  resources :user_instruments, only: [:index, :new, :create, :edit, :update, :destroy]

  resources :matches, only: [:index] do
    post :approve, on: :collection
    post :decline, on: :collection
  end

  resources :conversations, only: [:index, :show] do
    resources :messages, only: [:create]
  end
end
