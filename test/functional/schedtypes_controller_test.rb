require 'test_helper'

class SchedtypesControllerTest < ActionController::TestCase
  setup do
    @schedtype = schedtypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedtypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedtype" do
    assert_difference('Schedtype.count') do
      post :create, schedtype: { scheddesc: @schedtype.scheddesc, schedname: @schedtype.schedname }
    end

    assert_redirected_to schedtype_path(assigns(:schedtype))
  end

  test "should show schedtype" do
    get :show, id: @schedtype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedtype
    assert_response :success
  end

  test "should update schedtype" do
    put :update, id: @schedtype, schedtype: { scheddesc: @schedtype.scheddesc, schedname: @schedtype.schedname }
    assert_redirected_to schedtype_path(assigns(:schedtype))
  end

  test "should destroy schedtype" do
    assert_difference('Schedtype.count', -1) do
      delete :destroy, id: @schedtype
    end

    assert_redirected_to schedtypes_path
  end
end
