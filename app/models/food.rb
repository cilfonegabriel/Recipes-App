class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true, length: { maximum: 150 }
  validates :measurement_unit, presence: true, length: { maximum: 10 }
  validates :price, presence: true, numericality: true
  validates :quantity, presence: true, numericality: true
  validates :user_id, presence: true

  def self.shopping_list(user)
    # Use eager loading to load the associated foods and recipes with the query
    current_food = Food.includes(:user).where(users: { id: user.id })
    recipe_food = RecipeFood.includes(food: :recipe).where(recipes: { public: true })

    # Use Enumerable#each_with_object instead of an empty hash and manual iteration
    shoping = recipe_food.each_with_object({}) do |recipe_food_item, shopping_list|
      shopping_list[recipe_food_item.food.name] ||= 0
      shopping_list[recipe_food_item.food.name] += recipe_food_item.quantity
    end

    shopping_list = shoping.sort.to_h
    shoping = shopping_list.map { |food, quantity| [food, quantity] }



    current_food.each do |food|
      if shoping[food.name]
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
