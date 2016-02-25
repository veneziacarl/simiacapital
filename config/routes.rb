Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users

  resources :pages
  match '/portal', to: 'pages#portal', via: 'get'
  match '/subscribe', to: 'pages#subscribe', via: 'post'
  match '/unsubscribe', to: 'pages#unsubscribe', via: 'post'

  resources :contacts, only: [:new, :create]
  match '/contacts', to: 'contacts#new', via: 'get'
end
