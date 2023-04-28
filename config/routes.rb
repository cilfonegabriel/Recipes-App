Rails.application.routes.draw do
  devise_for :users

  resources :recipes, only: [:index, :new, :create, :show, :update, :destroy]
  resources :recipe_foods, only: [:new, :create,:update, :destroy] 
  
  get 'shoping-list', to: 'foods#shoping_list'
  get 'public-recipes', to: 'recipes#public_recipes'

  resources :foods, only: [:index, :new, :create, :show, :update, :destroy] 

  root "recipes#public_recipes"
end


