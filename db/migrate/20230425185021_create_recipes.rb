class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparation_time
      t.integer :cooking_time
      t.text :description
      t.references :user, null: false, foreign_key: true, index: { unique: false, name: 'user_recipes_index'}

      t.timestamps
    end
  end
end
