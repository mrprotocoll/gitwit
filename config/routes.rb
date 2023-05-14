Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/sign-up", to: "registration#new"

  resources :users

  # Defines the root path route ("/")
  root "main#index"
end
