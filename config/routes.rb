Rails.application.routes.draw do

  devise_for :users
  devise_for :user_supliers
  root to: 'pages#home'
  get 'search', to:"products#search"
  get 'autocomplete', to:"products#autocomplete"
  get 'about', to:"pages#about"
  get 'dashboard', to:"pages#dashboard"

  resources :products, :only => [:index, :show] do
    resources :product_orders, :only => [:create]
  end
  resources :orders, :only => [:index, :show, :update] do
    resources :product_orders, :only => [:index, :update]
  end
  resources :product_orders, :only => [:destroy]
  resources :categories, :only => [:show]
  resources :supliers, :only => [:show, :new, :create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
