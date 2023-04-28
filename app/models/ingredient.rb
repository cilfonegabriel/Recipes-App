class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :quantity, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  validates :recipe_id, presence: true
  validates :food_id, presence: true
end
