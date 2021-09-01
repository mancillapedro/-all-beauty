Rails.application.routes.draw do

  devise_for :users
  devise_for :user_supliers
  root to: 'pages#home'
  get 'search', to:"products#search"
  get 'autocomplete', to:"products#autocomplete"
  get 'about', to:"pages#about"
  get 'dashboard', to:"pages#dashboard"

  resources :products, :only => [:index, :show, :new, :create, :update, :edit, :destroy] do
    resources :product_orders, :only => [:create]
  end

  resources :orders, :only => [:index, :show, :update] do
    resources :product_orders, :only => [:index, :update]
  end

  resources :product_orders, :only => [:destroy]
  resources :categories, :only => [:show]
  resources :supliers, :only => [:show, :new, :create, :edit, :update]

  get 'dashboard2', to:'suplier_user_supliers#index'
  resources :suplier_user_supliers, :only => [:show]
  get 'down', to:'suplier_user_supliers#down'
  get 'up', to:'suplier_user_supliers#up'

  resources :suplier_product_orders, :only => [:update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
