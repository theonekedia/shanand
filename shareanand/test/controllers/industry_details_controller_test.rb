require 'test_helper'

class IndustryDetailsControllerTest < ActionController::TestCase
  setup do
    @industry_detail = industry_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:industry_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create industry_detail" do
    assert_difference('IndustryDetail.count') do
      post :create, industry_detail: {  }
    end

    assert_redirected_to industry_detail_path(assigns(:industry_detail))
  end

  test "should show industry_detail" do
    get :show, id: @industry_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @industry_detail
    assert_response :success
  end

  test "should update industry_detail" do
    patch :update, id: @industry_detail, industry_detail: {  }
    assert_redirected_to industry_detail_path(assigns(:industry_detail))
  end

  test "should destroy industry_detail" do
    assert_difference('IndustryDetail.count', -1) do
      delete :destroy, id: @industry_detail
    end

    assert_redirected_to industry_details_path
  end
end
