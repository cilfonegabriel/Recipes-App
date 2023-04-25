Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    resources :foods, only: [:index, :show, :edit, :update, :destroy] 
  end

  root "users#show"
end