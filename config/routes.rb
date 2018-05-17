Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events

  match "/auth/:provider/callback" => "sessions#create", as: :auth_callback, via: [:get, :post]
  match "/auth/failure" => "sessions#failure", as: :auth_failure, via: [:get, :post]
  match "/logout" => "sessions#destroy", as: :logout, via: [:get, :post]

  root 'events#index'
end
