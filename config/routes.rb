Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#home"
  resources :users, only: :show
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :gardens do
    resources :garden_plants, only: %i[index show new create]
  end

  resources :garden_plants, only: %i[destroy edit update]

  resources :plants, only: %i[index show new create update]
end
