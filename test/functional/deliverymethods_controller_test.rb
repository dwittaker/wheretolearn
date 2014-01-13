require 'test_helper'

class DeliverymethodsControllerTest < ActionController::TestCase
  setup do
    @deliverymethod = deliverymethods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deliverymethods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deliverymethod" do
    assert_difference('Deliverymethod.count') do
      post :create, deliverymethod: { dmcod: @deliverymethod.dmcod, dmdesc: @deliverymethod.dmdesc, dmimgh: @deliverymethod.dmimgh, dmimgtype: @deliverymethod.dmimgtype, dmimgurl: @deliverymethod.dmimgurl, dmimgw: @deliverymethod.dmimgw }
    end

    assert_redirected_to deliverymethod_path(assigns(:deliverymethod))
  end

  test "should show deliverymethod" do
    get :show, id: @deliverymethod
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deliverymethod
    assert_response :success
  end

  test "should update deliverymethod" do
    put :update, id: @deliverymethod, deliverymethod: { dmcod: @deliverymethod.dmcod, dmdesc: @deliverymethod.dmdesc, dmimgh: @deliverymethod.dmimgh, dmimgtype: @deliverymethod.dmimgtype, dmimgurl: @deliverymethod.dmimgurl, dmimgw: @deliverymethod.dmimgw }
    assert_redirected_to deliverymethod_path(assigns(:deliverymethod))
  end

  test "should destroy deliverymethod" do
    assert_difference('Deliverymethod.count', -1) do
      delete :destroy, id: @deliverymethod
    end

    assert_redirected_to deliverymethods_path
  end
end
