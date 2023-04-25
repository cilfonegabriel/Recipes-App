Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    resources :foods, only: [:show, :edit, :update, :destroy] 

  root "users#show"
end
