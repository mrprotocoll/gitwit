Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/sign-up", to: "registration#new"
  post "/sign-up", to: "registration#create"

  get "/login", to: "session#new"
  post "/login", to: "session#create"
  delete "/logout", to: "session#destroy"

  resources :users
  get "/profile", to: "users#index"

  get "/password", to: "password#edit", as: "edit_password"
  patch "/password", to: "password#update", as: "update_password"

  get "password/reset", to: "password_resets#new", as: :password_reset
  post "password/reset", to: "password_resets#create", as: :create_password_reset

  # Defines the root path route ("/")
  root "main#index"
end
