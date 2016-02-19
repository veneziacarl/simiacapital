Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users

  resources :pages
  match '/portal', to: 'pages#portal', via: 'get'

  resources :contacts, only: [:new, :create]
  match '/contacts', to: 'contacts#new', via: 'get'
end
