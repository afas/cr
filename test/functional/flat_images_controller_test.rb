require 'test_helper'

class FlatImagesControllerTest < ActionController::TestCase
  setup do
    @flat_image = flat_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flat_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flat_image" do
    assert_difference('FlatImage.count') do
      post :create, flat_image: @flat_image.attributes
    end

    assert_redirected_to flat_image_path(assigns(:flat_image))
  end

  test "should show flat_image" do
    get :show, id: @flat_image.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flat_image.to_param
    assert_response :success
  end

  test "should update flat_image" do
    put :update, id: @flat_image.to_param, flat_image: @flat_image.attributes
    assert_redirected_to flat_image_path(assigns(:flat_image))
  end

  test "should destroy flat_image" do
    assert_difference('FlatImage.count', -1) do
      delete :destroy, id: @flat_image.to_param
    end

    assert_redirected_to flat_images_path
  end
end
