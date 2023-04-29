require 'rails_helper'

RSpec.describe RecipeFoodsController, type: :controller do
  user = User.create(name: 'test', email: 'test@test.com', password: 'test1234', password_confirmation: 'test1234')
  let(:recipe) { create(:recipe, user:) }
  let(:food) { create(:food, user:) }
  let(:recipe_food) { create(:recipe_food, recipe:, food:) }

  describe 'POST #create' do
    it 'creates a new recipe_food' do
      expect do
        post :create, params: { recipe_food: { quantity: 1, food: food.name, recipe_id: recipe.id } }
      end.to change(RecipeFood, :count).by(1)
    end

    it 'redirects to recipe page' do
      post :create, params: { recipe_food: { quantity: 1, food: food.name, recipe_id: recipe.id } }
      expect(response).to redirect_to(recipe_url(recipe))
    end
  end

  describe 'DELETE #destroy' do
    let(:recipe_food) { create(:recipe_food, recipe:, food:) }

    it 'deletes the recipe_food' do
      recipe_food
      expect do
        delete :destroy, params: { id: recipe_food.id }
      end.to change(RecipeFood, :count).by(-1)
    end

    it 'redirects to recipe page' do
      delete :destroy, params: { id: recipe_food.id }
      expect(response).to redirect_to(recipe_url(recipe))
    end
  end
end
