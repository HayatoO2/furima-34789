Rails.application.routes.draw do
  devise_for :users
  

  resources :items, only: [:index, :new, :create, :show] do
    resources :buys, only: [:index]
  end
  root to: "items#index"
end
