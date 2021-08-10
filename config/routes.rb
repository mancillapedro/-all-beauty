Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :products, :only => [:index, :show] do
    resources :product_orders, :only => [:create]
  end
  resources :orders, :only => [:index, :show, :create, :destroy] do
    resources :product_orders, :only => [:show]
  end
  resources :product_orders, :only => [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
