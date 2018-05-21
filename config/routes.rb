Rails.application.routes.draw do
  resources :events, via: [:get, :post]
  resources :sessions
  resources :companies

  match "/auth/:provider/callback" => "sessions#create", as: :auth_callback, via: [:get, :post]
  match "/auth/failure" => "sessions#failure", as: :auth_failure, via: [:get, :post]
  match "/logout" => "sessions#destroy", as: :logout, via: [:get, :post]
  match "events/my" => "events#show", via: [:get, :post]
  
  root 'events#index'
end
