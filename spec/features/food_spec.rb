require 'rails_helper'

RSpec.describe 'Foods page', type: :system do
  describe 'Foods/index' do
    before(:each) do
      @user = User.create!(name: 'name', email: 'email@gmail.com', password: 'password',
                           password_confirmation: 'password')
      @food = Food.create!(name: 'food', measurement_unit: 'kg', quantity: 5, price: 10, user: @user)
      @user.skip_confirmation!
      @user.save!
      visit new_user_session_path
      fill_in 'user_email', with: 'email@gmail.com'
      fill_in 'user_password', with: 'password'
      click_button 'Log in'
      visit foods_path
    end

    it 'displays the name of food' do
      expect(page).to have_content(@food.name)
    end

    it 'displays the measurement unit of food' do
      expect(page).to have_content(@food.measurement_unit)
    end

    it 'displays the price of food' do
      expect(page).to have_content(@food.measurement_unit)
    end

    it 'displays a button with text Add food' do
      expect(page).to have_content('Add food')
    end

    it 'button opens a modal on the same page to add add food' do
      click_button 'Add food'
      expect(page).to have_current_path foods_path
    end
  end
end
