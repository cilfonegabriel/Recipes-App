class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new; end

  def create; end

  def show
    @recipe = recipe_by_id
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

  private

  def recipe_by_id
    Recipe.find(params[:id])
  end

  def post_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
