require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
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
  end
end
