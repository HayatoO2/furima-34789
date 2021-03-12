Rails.application.routes.draw do
  devise_for :users
  

  resources :items, only: [:index, :new, :create, :show] do
    resources :buys, only: [:index, :create]
  end
  root to: "items#index"
end
