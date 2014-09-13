Rails.application.routes.draw do
  resources :notes
  resource :authentication_token, only: [:update, :destroy]

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    registrations: 'users/registrations'
  }

  root to: 'home#index'
end
