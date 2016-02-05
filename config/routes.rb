Rails.application.routes.draw do
  root 'pages#index'

  resources :pages

  match '/contacts', to: 'contacts#new', via: 'get'
  resources :contacts, only: [:new, :create]
end
