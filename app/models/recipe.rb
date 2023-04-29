class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  validates :name, presence: true, length: { in: 2..250 }
  validates :description, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  scope :recent_recipes, -> { Recipe.where(public: true).last(5) }

  def self.sum_ingredients(user_id)
    recipes = User.find(user_id).recipes
    ingredients = {}
    recipes.each do |recipe|
      recipe.recipe_foods.includes(:food).each do |ingredient|
        if ingredients.key?(ingredient.food.name)
          ingredients[ingredient.food.name] += ingredient.quantity
        else
          ingredients[ingredient.food.name] = ingredient.quantity
        end
      end
    end
    ingredients
  end
end
