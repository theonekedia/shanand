require 'test_helper'

class RatiosAndAnalysesControllerTest < ActionController::TestCase
  setup do
    @ratios_and_analysis = ratios_and_analyses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ratios_and_analyses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ratios_and_analysis" do
    assert_difference('RatiosAndAnalysis.count') do
      post :create, ratios_and_analysis: {  }
    end

    assert_redirected_to ratios_and_analysis_path(assigns(:ratios_and_analysis))
  end

  test "should show ratios_and_analysis" do
    get :show, id: @ratios_and_analysis
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ratios_and_analysis
    assert_response :success
  end

  test "should update ratios_and_analysis" do
    patch :update, id: @ratios_and_analysis, ratios_and_analysis: {  }
    assert_redirected_to ratios_and_analysis_path(assigns(:ratios_and_analysis))
  end

  test "should destroy ratios_and_analysis" do
    assert_difference('RatiosAndAnalysis.count', -1) do
      delete :destroy, id: @ratios_and_analysis
    end

    assert_redirected_to ratios_and_analyses_path
  end
end
