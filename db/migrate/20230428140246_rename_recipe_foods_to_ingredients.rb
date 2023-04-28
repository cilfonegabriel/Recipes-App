class RenameRecipeFoodsToIngredients < ActiveRecord::Migration[7.0]
  def change
    rename_table :recipe_foods, :ingredients
  end
end
