require 'rails_helper'

RSpec.describe 'Recipes Page', type: :system do
  describe 'Recipe/index' do
    before :each do
      @user = User.create!(name: 'name', email: 'email@gmail.com', password: 'password',
                           password_confirmation: 'password')
      @recipe = Recipe.create!(name: 'recipe', preparation_time: '00:45', cooking_time: '00:50',
                               description: 'description', public: true, user_id: @user.id)
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'email@gmail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      visit recipes_path
    end

    it 'displays the name of recipe' do
      expect(page).to have_content(@recipe.name)
    end

    it 'displays the description of recipe' do
      expect(page).to have_content(@recipe.description)
    end

    it 'displays a button with text New Recipe' do
      expect(page).to have_content('New Recipe')
    end

    it 'button opens a modal on the same page to add new recipe' do
      click_button 'New Recipe'
      expect(page).to have_current_path recipes_path
    end

    it 'displays buttons with text REMOVE' do
      expect(page).to have_content('REMOVE')
    end
  end
end
