require 'test_helper'

class CosttypesControllerTest < ActionController::TestCase
  setup do
    @costtype = costtypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:costtypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create costtype" do
    assert_difference('Costtype.count') do
      post :create, costtype: { costdesc: @costtype.costdesc, costname: @costtype.costname }
    end

    assert_redirected_to costtype_path(assigns(:costtype))
  end

  test "should show costtype" do
    get :show, id: @costtype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @costtype
    assert_response :success
  end

  test "should update costtype" do
    put :update, id: @costtype, costtype: { costdesc: @costtype.costdesc, costname: @costtype.costname }
    assert_redirected_to costtype_path(assigns(:costtype))
  end

  test "should destroy costtype" do
    assert_difference('Costtype.count', -1) do
      delete :destroy, id: @costtype
    end

    assert_redirected_to costtypes_path
  end
end
