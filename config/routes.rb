Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] 
  resources :recipes, only: [:index, :new, :create, :show, :update, :destroy]
  resources :recipe_foods, only: [:index, :new, :create, :show, :update, :destroy] 
  
  get 'shoping-list', to: 'foods#shoping_list'

  resources :foods, only: [:index, :new, :create, :show, :update, :destroy] 

  root "users#show"
end


