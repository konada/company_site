Rails.application.routes.draw do
  devise_for :users
  resources :contact_requests, only: [:index, :new, :create]
  resource :complaint
  root 'contact_requests#new'
  get 'admin', to: 'contact_requests#index'
end
