Rails.application.routes.draw do
  root "application#index"

  resources :products
end
