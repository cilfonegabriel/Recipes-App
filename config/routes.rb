Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  get '/public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'
  get '/general_shopping_list', to: 'recipe_foods#index', as: 'shopping_list'
  resources :foods, only: %i[index show create destroy]
  resources :recipes, only: %i[index show create update destroy]
  resources :recipe_foods, only: %i[create destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
