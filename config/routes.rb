Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders
  end
  get 'items/:id', to: 'items#checked'
end