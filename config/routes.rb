Rails.application.routes.draw do
  root "home#index"
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :posts
  resources :users, only: [:show, :edit, :update, :destroy, :index]
end
