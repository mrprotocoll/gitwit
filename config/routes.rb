Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/sign-up", to: "registration#new"
  post "/sign-up", to: "registration#create"
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"

  resources :users

  # Defines the root path route ("/")
  root "main#index"
end
