class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :recipes, dependent: :destroy
  has_many :foods, dependent: :destroy

  def self.create_shopping_list(user_id)
    recipes_ingredients = Recipe.sum_ingredients(user_id)
    user_ingredients = User.find(user_id).foods
    missing_ingredients = []
    user_ingredients.each do |food|
      next if recipes_ingredients[food.name].nil?

      quantity = recipes_ingredients[food.name] - food.quantity
      next unless quantity.positive?

      missing = {
        name: food.name,
        quantity:,
        total_price: quantity * food.price,
        measurement_unit: food.measurement_unit
      }
      missing_ingredients << missing
    end
    missing_ingredients
  end
end
