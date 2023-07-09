Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :posts
  resources :users, only: [:show, :edit, :update, :destroy, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
