class IngredientsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new
    respond_to do |format|
      format.html { render :new, locals: { ingredient: @ingredient }}
    end
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    respond_to do |format|
      format.html do
        if @ingredient.save
          redirect_to recipe_path(params[:recipe_id])
        else
          redirect_to public_recipes_path
        end
      end
    end
  end

  private

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:quantity, :recipe_id, :food_id)
  end
end
