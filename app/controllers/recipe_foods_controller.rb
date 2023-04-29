class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]

  # GET /recipe_foods or /recipe_foods.json
  def index
    # show all foods in all recipes that are missing from the inventory
    @shopping_list = User.create_shopping_list(current_user.id)
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    unless current_user.foods.exists?(name: params[:recipe_food][:food])
      current_user.foods.create!(name: params[:recipe_food][:food],
                                 measurement_unit: params[:recipe_food][:measurement_unit],
                                 price: params[:recipe_food][:price], quantity: 0)
    end

    @recipe_food = RecipeFood.new(quantity: params[:recipe_food][:quantity])
    @recipe_food.food = Food.find_by(name: params[:recipe_food][:food])
    @recipe_food.recipe = Recipe.find(params[:recipe_food][:recipe_id])

    respond_to do |format|
      if @recipe_food.save!
        format.html do
          redirect_to recipe_url(@recipe_food.recipe), notice: 'The ingredient was successfully added to the recipe.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipe_url(@recipe_food.recipe), notice: 'Ingredient deleted successfully.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food, :recipe_id, :measurement_unit, :price)
  end
end
