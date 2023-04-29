module ApplicationHelper
  def recipe_total_value(recipe)
    recipe.recipe_foods.includes(:food).sum { |rf| rf.food.price * rf.quantity }
  end
end
