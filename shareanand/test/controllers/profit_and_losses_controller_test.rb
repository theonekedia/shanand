require 'test_helper'

class ProfitAndLossesControllerTest < ActionController::TestCase
  setup do
    @profit_and_loss = profit_and_losses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profit_and_losses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profit_and_loss" do
    assert_difference('ProfitAndLoss.count') do
      post :create, profit_and_loss: {  }
    end

    assert_redirected_to profit_and_loss_path(assigns(:profit_and_loss))
  end

  test "should show profit_and_loss" do
    get :show, id: @profit_and_loss
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profit_and_loss
    assert_response :success
  end

  test "should update profit_and_loss" do
    patch :update, id: @profit_and_loss, profit_and_loss: {  }
    assert_redirected_to profit_and_loss_path(assigns(:profit_and_loss))
  end

  test "should destroy profit_and_loss" do
    assert_difference('ProfitAndLoss.count', -1) do
      delete :destroy, id: @profit_and_loss
    end

    assert_redirected_to profit_and_losses_path
  end
end
