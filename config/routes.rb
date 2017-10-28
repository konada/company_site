Rails.application.routes.draw do
  devise_for :users
  resources :contact_requests, only: [:index, :new, :create]
  resource :complaint, only: [:new, :create]
  root 'contact_requests#new'
  get 'admin', to: 'contact_requests#index'

  mount ContactRequestApi::V1 => '/'
  mount GrapeSwaggerRails::Engine, at: "/documentation"
end
