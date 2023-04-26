class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]
  # GET /foods or /foods.json
  def index
    @user = User.find(current_user.id)
    @foods = Food.includes(:user).where(user_id: current_user.id)
  end
  # GET /foods/1 or /foods/1.json
  def show
    @user = User.find(current_user.id)
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

    respond_to do |format|
      if @food.save
        format.html { redirect_to user_foods_path(current_user), notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy

    respond_to do |format|
      format.html { redirect_to user_foods_path(current_user), notice: 'Food was successfully destroyed.' }
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