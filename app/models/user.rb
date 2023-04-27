class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :recipes
  has_many :foods

  validates :name, presence: true
  validates :email, presence: true

  def current_user
    User.find(params[:user_id])
  end
end
