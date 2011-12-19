require 'test_helper'

class WelcomeImagesControllerTest < ActionController::TestCase
  setup do
    @welcome_image = welcome_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:welcome_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create welcome_image" do
    assert_difference('WelcomeImage.count') do
      post :create, welcome_image: @welcome_image.attributes
    end

    assert_redirected_to welcome_image_path(assigns(:welcome_image))
  end

  test "should show welcome_image" do
    get :show, id: @welcome_image.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @welcome_image.to_param
    assert_response :success
  end

  test "should update welcome_image" do
    put :update, id: @welcome_image.to_param, welcome_image: @welcome_image.attributes
    assert_redirected_to welcome_image_path(assigns(:welcome_image))
  end

  test "should destroy welcome_image" do
    assert_difference('WelcomeImage.count', -1) do
      delete :destroy, id: @welcome_image.to_param
    end

    assert_redirected_to welcome_images_path
  end
end
