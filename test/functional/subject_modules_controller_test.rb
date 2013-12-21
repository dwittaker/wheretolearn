require 'test_helper'

class SubjectModulesControllerTest < ActionController::TestCase
  setup do
    @subject_module = subject_modules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subject_modules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subject_module" do
    assert_difference('SubjectModule.count') do
      post :create, subject_module: { category4: @subject_module.category4, category5: @subject_module.category5, description: @subject_module.description, moduleid: @subject_module.moduleid, name: @subject_module.name, order: @subject_module.order, purpose: @subject_module.purpose, subjectid: @subject_module.subjectid, subjectmoduleid: @subject_module.subjectmoduleid }
    end

    assert_redirected_to subject_module_path(assigns(:subject_module))
  end

  test "should show subject_module" do
    get :show, id: @subject_module
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subject_module
    assert_response :success
  end

  test "should update subject_module" do
    put :update, id: @subject_module, subject_module: { category4: @subject_module.category4, category5: @subject_module.category5, description: @subject_module.description, moduleid: @subject_module.moduleid, name: @subject_module.name, order: @subject_module.order, purpose: @subject_module.purpose, subjectid: @subject_module.subjectid, subjectmoduleid: @subject_module.subjectmoduleid }
    assert_redirected_to subject_module_path(assigns(:subject_module))
  end

  test "should destroy subject_module" do
    assert_difference('SubjectModule.count', -1) do
      delete :destroy, id: @subject_module
    end

    assert_redirected_to subject_modules_path
  end
end
