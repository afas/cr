require 'test_helper'

class StaticImagesControllerTest < ActionController::TestCase
  setup do
    @static_image = static_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:static_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create static_image" do
    assert_difference('StaticImage.count') do
      post :create, static_image: @static_image.attributes
    end

    assert_redirected_to static_image_path(assigns(:static_image))
  end

  test "should show static_image" do
    get :show, id: @static_image.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @static_image.to_param
    assert_response :success
  end

  test "should update static_image" do
    put :update, id: @static_image.to_param, static_image: @static_image.attributes
    assert_redirected_to static_image_path(assigns(:static_image))
  end

  test "should destroy static_image" do
    assert_difference('StaticImage.count', -1) do
      delete :destroy, id: @static_image.to_param
    end

    assert_redirected_to static_images_path
  end
end
