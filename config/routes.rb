Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  get 'search', to:"products#search"

  resources :products, :only => [:index, :show] do
    resources :product_orders, :only => [:create]
  end
  resources :orders, :only => [:index, :show, :update] do
    resources :product_orders, :only => [:index]
  end
  resources :product_orders, :only => [:destroy, :update]
  resources :categories, :only => [:show]
  resources :supliers, :only => [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
