Rails.application.routes.draw do
  root 'products#index'

  namespace :admin do
    # controller admin/orders:
    # module Admin
    #   class OrdersController
    resources :orders do
      # each order has one invoice (nested resource)
      resource :invoice, only: :show
    end
  end

  get 'about_us' => 'home#about_us' # in home_controller set up method about_us
  get 'profile', to: :show, controller: 'users'

  resources :products do
    collection do
      # search for all products
      get 'search'
    end

    get 'full_description', as: :full_desc # by default it's on member
  end

  %w( 403 404 422 500 ).each do |code|
    get code, to: 'errors#show', code: code
  end
end
