class HomeController < ApplicationController
  def index
    @recent_users = User.last(5)
    @recent_recipes = Recipe.recent_recipes
  end
end
