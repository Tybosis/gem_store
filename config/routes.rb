Rails.application.routes.draw do
  root "application#index"

  namespace :api do
    resources :products
    resources :categories, only: :index
  end
end
