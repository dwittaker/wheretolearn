require 'test_helper'

class SourcetypesControllerTest < ActionController::TestCase
  setup do
    @sourcetype = sourcetypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sourcetypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sourcetype" do
    assert_difference('Sourcetype.count') do
      post :create, sourcetype: { stcod: @sourcetype.stcod, stdesc: @sourcetype.stdesc }
    end

    assert_redirected_to sourcetype_path(assigns(:sourcetype))
  end

  test "should show sourcetype" do
    get :show, id: @sourcetype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sourcetype
    assert_response :success
  end

  test "should update sourcetype" do
    put :update, id: @sourcetype, sourcetype: { stcod: @sourcetype.stcod, stdesc: @sourcetype.stdesc }
    assert_redirected_to sourcetype_path(assigns(:sourcetype))
  end

  test "should destroy sourcetype" do
    assert_difference('Sourcetype.count', -1) do
      delete :destroy, id: @sourcetype
    end

    assert_redirected_to sourcetypes_path
  end
end
