Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get :about, to: 'static_pages#about'
  root to: "landing#index"


  resources :items , only: [:index, :show, :edit]

  resources :users, only: [:new, :edit, :create, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :ordered_items, only: [:add, :create]

  resources :orders, only: [:create]
  resources :carts, only: [:index, :add, :show :edit, :remove]

  resources :checkouts, only: [:new, :create]


  post :add, to: 'carts#add'
  post :remove, to: 'carts#remove'

  match 'auth/:provider/callback', to: 'omniauth#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'omniauth#destroy', as: 'signout', via: [:get, :post]
end
