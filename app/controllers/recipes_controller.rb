class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new; end

  def create; end

  def show
    @recipe = recipe_by_id
  end

  def destroy; end

  private

  def recipe_by_id
    Recipe.find(params[:id])
  end

  def post_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
