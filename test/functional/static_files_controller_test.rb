require 'test_helper'

class StaticFilesControllerTest < ActionController::TestCase
  setup do
    @static_file = static_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:static_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create static_file" do
    assert_difference('StaticFile.count') do
      post :create, static_file: @static_file.attributes
    end

    assert_redirected_to static_file_path(assigns(:static_file))
  end

  test "should show static_file" do
    get :show, id: @static_file.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @static_file.to_param
    assert_response :success
  end

  test "should update static_file" do
    put :update, id: @static_file.to_param, static_file: @static_file.attributes
    assert_redirected_to static_file_path(assigns(:static_file))
  end

  test "should destroy static_file" do
    assert_difference('StaticFile.count', -1) do
      delete :destroy, id: @static_file.to_param
    end

    assert_redirected_to static_files_path
  end
end
