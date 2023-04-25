class Food < ApplicationRecord
    belongs_to :user

    validates :name, presence: true, length: { maximum: 150 }
    validates :measurement_unit, presence: true, length: { maximum: 10 }
    validates :price, presence: true, numericality: true
    validates :quantity, presence: true, numericality: true
    validates :user_id, presence: true
end
