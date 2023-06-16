Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/edit'
  get 'bookings/update'
  get 'bookings/destroy'
  get 'band_spaces/index'
  get 'band_spaces/new'
  get 'band_spaces/create'
  get 'band_spaces/edit'
  get 'band_spaces/update'
  get 'band_spaces/destroy'
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

  resources :users, only: [:edit, :update]
  get "users/:id", to: "users#show", as: :show_user
  get "users/me/:id",to: "users#me", as: :my_profile
  resources :genres, only: [:index]
  resources :user_genres, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :instruments, only: [:index]
  resources :user_instruments, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :matches, only: [:index] do
    post :approve, on: :collection
    post :decline, on: :collection
    collection do
      get :confirmed
    end
  end

  resources :band_spaces do
    resources :bookings
  end
  resources :bookings do
    collection do
      get :mine
    end
  end

  resources :conversations, only: [:index, :show] do
    resources :messages, only: [:create]
  end
end
