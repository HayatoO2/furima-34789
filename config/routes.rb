Rails.application.routes.draw do
  devise_for :users
  

  resources :items, only: [:index, :new, :create, :show]
  resources :buys, only: [:index]
  root to: "items#index"
end
