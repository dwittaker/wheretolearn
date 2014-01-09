require 'test_helper'

class ContenttagsControllerTest < ActionController::TestCase
  setup do
    @contenttag = contenttags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contenttags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contenttag" do
    assert_difference('Contenttag.count') do
      post :create, contenttag: { ctagdesc: @contenttag.ctagdesc }
    end

    assert_redirected_to contenttag_path(assigns(:contenttag))
  end

  test "should show contenttag" do
    get :show, id: @contenttag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contenttag
    assert_response :success
  end

  test "should update contenttag" do
    put :update, id: @contenttag, contenttag: { ctagdesc: @contenttag.ctagdesc }
    assert_redirected_to contenttag_path(assigns(:contenttag))
  end

  test "should destroy contenttag" do
    assert_difference('Contenttag.count', -1) do
      delete :destroy, id: @contenttag
    end

    assert_redirected_to contenttags_path
  end
end
