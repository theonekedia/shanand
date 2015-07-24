require 'test_helper'

class RiskAndReturnsControllerTest < ActionController::TestCase
  setup do
    @risk_and_return = risk_and_returns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:risk_and_returns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create risk_and_return" do
    assert_difference('RiskAndReturn.count') do
      post :create, risk_and_return: {  }
    end

    assert_redirected_to risk_and_return_path(assigns(:risk_and_return))
  end

  test "should show risk_and_return" do
    get :show, id: @risk_and_return
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @risk_and_return
    assert_response :success
  end

  test "should update risk_and_return" do
    patch :update, id: @risk_and_return, risk_and_return: {  }
    assert_redirected_to risk_and_return_path(assigns(:risk_and_return))
  end

  test "should destroy risk_and_return" do
    assert_difference('RiskAndReturn.count', -1) do
      delete :destroy, id: @risk_and_return
    end

    assert_redirected_to risk_and_returns_path
  end
end
