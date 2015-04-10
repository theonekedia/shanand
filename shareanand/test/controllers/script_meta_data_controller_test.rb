require 'test_helper'

class ScriptMetaDataControllerTest < ActionController::TestCase
  setup do
    @script_meta_datum = script_meta_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:script_meta_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create script_meta_datum" do
    assert_difference('ScriptMetaDatum.count') do
      post :create, script_meta_datum: {  }
    end

    assert_redirected_to script_meta_datum_path(assigns(:script_meta_datum))
  end

  test "should show script_meta_datum" do
    get :show, id: @script_meta_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @script_meta_datum
    assert_response :success
  end

  test "should update script_meta_datum" do
    patch :update, id: @script_meta_datum, script_meta_datum: {  }
    assert_redirected_to script_meta_datum_path(assigns(:script_meta_datum))
  end

  test "should destroy script_meta_datum" do
    assert_difference('ScriptMetaDatum.count', -1) do
      delete :destroy, id: @script_meta_datum
    end

    assert_redirected_to script_meta_data_path
  end
end
