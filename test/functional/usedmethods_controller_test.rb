require 'test_helper'

class UsedmethodsControllerTest < ActionController::TestCase
  setup do
    @usedmethod = usedmethods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usedmethods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create usedmethod" do
    assert_difference('Usedmethod.count') do
      post :create, usedmethod: {  }
    end

    assert_redirected_to usedmethod_path(assigns(:usedmethod))
  end

  test "should show usedmethod" do
    get :show, id: @usedmethod
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @usedmethod
    assert_response :success
  end

  test "should update usedmethod" do
    put :update, id: @usedmethod, usedmethod: {  }
    assert_redirected_to usedmethod_path(assigns(:usedmethod))
  end

  test "should destroy usedmethod" do
    assert_difference('Usedmethod.count', -1) do
      delete :destroy, id: @usedmethod
    end

    assert_redirected_to usedmethods_path
  end
end
