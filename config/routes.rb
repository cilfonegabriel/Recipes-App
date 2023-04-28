Rails.application.routes.draw do
  devise_for :users

  resources :recipes, only: [:index, :new, :create, :show, :update, :destroy] do
    resources :ingredients, only: [:new, :create]
  end
  resources :foods, only: [:index, :new, :create, :show, :update, :destroy] 
  
  get 'shoping-list', to: 'foods#shoping_list'
  get 'public-recipes', to: 'recipes#public_recipes'


  root "recipes#public_recipes"
end


