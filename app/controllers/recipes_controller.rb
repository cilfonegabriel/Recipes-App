class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes.order(created_at: :desc)
  end

  def new; end

  def create; end

  def show
    @recipe = recipe_by_id
    @ingredients = Ingredient.where(recipe_id: @recipe.id)
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update_attribute(:public, !@recipe.public)
    redirect_to recipe_path(@recipe.id)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    respond_to do |format|
      format.html do
        if @recipe.destroy
          redirect_to recipes_path
        else
          flash.now[:error] = 'Error: could not delete recipe'
        end
      end
    end
  end

  def public_recipes
    @recipes = Recipe.where('public = true')
  end

  def new_ingredient
    @new_recipe = Recipe_food.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  private

  def recipe_by_id
    Recipe.find(params[:id])
  end

  def post_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
