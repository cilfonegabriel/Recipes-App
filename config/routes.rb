Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] 
  resources :foods, only: [:index, :show, :edit, :update, :destroy] 
  resources :recipes, only: [:index, :new, :create, :show, :update, :destroy]

  root "users#show"
end