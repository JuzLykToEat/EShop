Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get :about, to: 'static_pages#about'
  root to: "landing#index"
end
