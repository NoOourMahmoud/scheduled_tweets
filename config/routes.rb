Rails.application.routes.draw do
  
  get "about", to: "about#index"

  #changing password where the account is openned
  get "password", to: "password#edit"
  patch "password", to: "password#update"

  get "sign_in", to: "session#logInScreen"
  post "sign_in", to: "session#signInUser"

  get "sign_up", to: "register#newuser"
  post "sign_up", to: "register#createUser"

  #for forget password
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  post "password/reset/edit", to: "password_resets#update"
  patch "password/reset/edit", to: "password_resets#update"

  delete "log_out", to: "session#destroy"

  root to: "main#index"

  get "/auth/twitter/callback", to: "omniauth_callbacks#twitter"

  resources :twitter_accounts
  resources :tweets

 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
