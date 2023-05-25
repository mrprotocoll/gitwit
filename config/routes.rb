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
  post "password/reset", to: "password_resets#create", as: :password_reset_create
  get "password/reset/edit", to: "password_resets#edit", as: :password_reset_edit
  patch "password/reset/edit", to: "password_resets#update", as: :password_reset_update

  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"

  resources :twitter_accounts
  resources :tweets
  
  # Defines the root path route ("/")
  root "main#index"
end
