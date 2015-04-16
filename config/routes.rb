Rails.application.routes.draw do
  root "application#index"

  resources :products
  resources :categories, only: :index
end
