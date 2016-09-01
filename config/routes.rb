Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get :about, to: 'static_pages#about'
  root to: "landing#index"


  resources :items , only: [:index, :show, :edit]

  resources :users, only: [:new, :edit, :create, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :ordered_items, only: [:add, :create]

  resources :carts, only: [:add, :show, :remove]

  post :add, to: 'carts#add'
  post :remove, to: 'carts#remove'

end
