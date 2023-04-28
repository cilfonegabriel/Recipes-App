class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  # GET /foods or /foods.json
  def index
    @user = User.find(current_user.id)
    @foods = Food.includes(:user).where(user_id: current_user.id)
  end

  # GET /foods/1 or /foods/1.json

  def show
    @food = Food.find(params[:id])
    @ingredient = Ingredient.find_by(food_id: @food.id)
    @user = User.find(current_user.id)

    return unless @ingredient.nil?

    flash[:notice] = 'This food item has not been used in any recipes yet'
  end

  # GET /foods/new
  def new
    @user = User.find(current_user.id)
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit; end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)
    @food.user = current_user

    if @food.save
      flash[:notice] = 'Food was successfully created.'
      redirect_to foods_path(current_user)
    else
      flash[:alert] = 'Food could not be created.'
      render :new
    end
  end

  def update
    if @food.update(food_params)
      flash[:success] = 'Food item successfully updated!'
      redirect_to foods_path
    else
      flash.now[:error] = 'Food item update failed!'
      render :edit
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to foods_path(current_user), notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def shoping_list
    @shoping_list = Food.shoping_list
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, :user_id)
  end
end
