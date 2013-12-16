require 'test_helper'

class PortfoliosControllerTest < ActionController::TestCase
  setup do
    @portfolio = portfolios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:portfolios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create portfolio" do
    assert_difference('Portfolio.count') do
      post :create, portfolio: { cost: @portfolio.cost, costtype: @portfolio.costtype, currency: @portfolio.currency, enddate: @portfolio.enddate, method: @portfolio.method, physaddress: @portfolio.physaddress, portfolioid: @portfolio.portfolioid, pweburl: @portfolio.pweburl, schedtype: @portfolio.schedtype, sourceid: @portfolio.sourceid, startdate: @portfolio.startdate, subjectid: @portfolio.subjectid }
    end

    assert_redirected_to portfolio_path(assigns(:portfolio))
  end

  test "should show portfolio" do
    get :show, id: @portfolio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @portfolio
    assert_response :success
  end

  test "should update portfolio" do
    put :update, id: @portfolio, portfolio: { cost: @portfolio.cost, costtype: @portfolio.costtype, currency: @portfolio.currency, enddate: @portfolio.enddate, method: @portfolio.method, physaddress: @portfolio.physaddress, portfolioid: @portfolio.portfolioid, pweburl: @portfolio.pweburl, schedtype: @portfolio.schedtype, sourceid: @portfolio.sourceid, startdate: @portfolio.startdate, subjectid: @portfolio.subjectid }
    assert_redirected_to portfolio_path(assigns(:portfolio))
  end

  test "should destroy portfolio" do
    assert_difference('Portfolio.count', -1) do
      delete :destroy, id: @portfolio
    end

    assert_redirected_to portfolios_path
  end
end
