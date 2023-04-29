require 'rails_helper'

RSpec.describe 'Recipes Page', type: :system do
  describe 'public_recipes' do
    before :each do
      @user = User.create!(name: 'name', email: 'email@gmail.com', password: 'password')
      @recipe = Recipe.create!(name: 'recipe', preparation_time: '01:10', cooking_time: '00:20',
                               description: 'description', public: true, user: @user)
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'email@gmail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      visit public_recipes_path
    end

    it 'displays the name of recipe' do
      expect(page).to have_content(@recipe.name)
    end

    it 'displays the name of the user' do
      expect(page).to have_content(@user.name)
    end

    it 'displays a button with text New Recipe' do
      expect(page).to have_content('New Recipe')
    end

    it 'button opens a modal to add new recipe on the same page' do
      click_button 'New Recipe'
      expect(page).to have_current_path public_recipes_path
    end
  end
end
