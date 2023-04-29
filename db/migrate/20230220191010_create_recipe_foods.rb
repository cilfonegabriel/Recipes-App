class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.decimal :quantity

      t.timestamps
    end
    add_reference :recipe_foods, :food, foreign_key: true
    add_reference :recipe_foods, :recipe, foreign_key: true
  end
end
