require 'test_helper'

class FoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food = foods(:one)
    @user = users(:one)
  end

  test "should get index" do
    get user_foods_url(@user)
    assert_response :success
  end

  test "should get new" do
    get new_user_food_url(@user)
    assert_response :success
  end

  test "should create food" do
    assert_difference('Food.count') do
      post user_foods_url(@user), params: { food: { name: @food.name, measurement_unit: @food.measurement_unit, price: @food.price, quantity: @food.quantity } }
    end

    assert_redirected_to food_url(Food.last)
  end

  test "should show food" do
    get user_food_url(@user, @food)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_food_url(@user, @food)
    assert_response :success
  end

  test "should update food" do
    patch user_food_url(@user, @food), params: { food: { name: @food.name, measurement_unit: @food.measurement_unit, price: @food.price, quantity: @food.quantity } }
    assert_redirected_to food_url(@food)
  end

  test "should destroy food" do
    assert_difference('Food.count', -1) do
      delete user_food_url(@user, @food)
    end

    assert_redirected_to foods_url
  end
end