require 'test_helper'

class DayTradingsControllerTest < ActionController::TestCase
  setup do
    @day_trading = day_tradings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:day_tradings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create day_trading" do
    assert_difference('DayTrading.count') do
      post :create, day_trading: {  }
    end

    assert_redirected_to day_trading_path(assigns(:day_trading))
  end

  test "should show day_trading" do
    get :show, id: @day_trading
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @day_trading
    assert_response :success
  end

  test "should update day_trading" do
    patch :update, id: @day_trading, day_trading: {  }
    assert_redirected_to day_trading_path(assigns(:day_trading))
  end

  test "should destroy day_trading" do
    assert_difference('DayTrading.count', -1) do
      delete :destroy, id: @day_trading
    end

    assert_redirected_to day_tradings_path
  end
end
