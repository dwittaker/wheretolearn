require 'test_helper'

class Category3sControllerTest < ActionController::TestCase
  setup do
    @category3 = category3s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category3s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category3" do
    assert_difference('Category3.count') do
      post :create, category3: { cat3cod: @category3.cat3cod, cat3desc: @category3.cat3desc }
    end

    assert_redirected_to category3_path(assigns(:category3))
  end

  test "should show category3" do
    get :show, id: @category3
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category3
    assert_response :success
  end

  test "should update category3" do
    put :update, id: @category3, category3: { cat3cod: @category3.cat3cod, cat3desc: @category3.cat3desc }
    assert_redirected_to category3_path(assigns(:category3))
  end

  test "should destroy category3" do
    assert_difference('Category3.count', -1) do
      delete :destroy, id: @category3
    end

    assert_redirected_to category3s_path
  end
end
