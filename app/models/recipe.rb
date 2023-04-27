class Recipe < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 250 }
  validates :preparation_time, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :description, presence: true
  validates :public, presence: true

  def public?
    public
  end

  
end
