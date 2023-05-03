Rails.application.routes.draw do
  get 'sessions/create'
  get 'orders/create'
  # get 'products/index'
  # get 'products/show'
  # get 'product/index'
  # get 'product/show'
  # get 'product/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#index"
  get "/products", to: "products#index"

  post "/orders", to: "orders#create"

  resources :users, only: [:create]

  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :products, only: [:index]

  get "*path", to: "pages#index", via: :all

end
