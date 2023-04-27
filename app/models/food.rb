class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true, length: { maximum: 150 }
  validates :measurement_unit, presence: true, length: { maximum: 10 }
  validates :price, presence: true, numericality: true
  validates :quantity, presence: true, numericality: true
  validates :user_id, presence: true

  def self.shoping_list
    current_food = Food.where(user_id: 1)
    shoping = {}

    recipe_food = RecipeFood.where(recipe_id: Recipe.where(public: true))
    recipe_food.each do |food|
      shoping[food.food.name] = (shoping[food.food.name] || 0) + food.quantity
    end

    current_food.each do |food|
      if shoping.key?(food.name)
        if shoping[food.name] > food.quantity
          shoping[food.name] -= food.quantity
        else
          shoping.delete(food.name)
        end
      end
    end
    shoping
  end
end
