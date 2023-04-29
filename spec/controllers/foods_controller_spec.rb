require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  describe 'Without logged in user' do
    describe 'GET #index' do
      it 'returns a redirect response when not logged in' do
        get :index
        expect(response).to have_http_status(302)
      end
    end
  end
  describe 'With user logged in' do
    login_user
    it 'returns a succes response when logged in' do
      get :index
      expect(response).to have_http_status(200)
    end

    describe 'POST #create' do
      it 'returns a succes response when logged in' do
        post :create, params: { food: { name: 'test', measurement_unit: 'test', price: 1, quantity: 1 } }
        expect(response).to have_http_status(302)
      end
    end

    describe 'DELETE #destroy' do
      it 'returns a succes response when logged in' do
        @user = User.create(name: 'test', email: 'mail@mail.com', password: 'password',
                            password_confirmation: 'password')
        food = Food.create!(name: 'test', measurement_unit: 'test', price: 1, quantity: 1, user: @user)
        delete :destroy, params: { id: food.id }
        expect(response).to have_http_status(302)
      end
    end
  end
end
