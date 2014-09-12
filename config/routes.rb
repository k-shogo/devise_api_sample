Rails.application.routes.draw do
  resources :notes
  resource :authentication_token, only: [:update, :destroy]

  devise_for :users

  root to: 'home#index'
end
