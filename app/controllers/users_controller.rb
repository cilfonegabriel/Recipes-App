class UsersController < ApplicationController
  # GET /users or /users.json
  def index; end

  # GET /users/1 OR /users/1.json
  def show; end

  # GET /users/new
  def new; end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create; end

  # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])
    end

      # Only allow a list of trusted parameters through.
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
