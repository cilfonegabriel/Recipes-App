Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]
  resources :recipes, only: [:index, :new, :create, :show, :destroy]

  root "users#show"
end
