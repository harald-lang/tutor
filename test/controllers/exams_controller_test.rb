require 'test_helper'

class ExamsControllerTest < ActionController::TestCase
  setup do
    sign_in :user, User.where(:email => 'admin@example.com').first
    @exam = exams(:one)
  end

  test "should get index" do
    #todo
    #get :index
    #assert_response :success
    #assert_not_nil assigns(:exams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exam" do
    assert_difference('Exam.count') do
      post :create, params: {exam: {name: @exam.name, original_import: @exam.original_import, start: @exam.start}}
    end

    assert_redirected_to exam_path(assigns(:exam))
  end

  test "should show exam" do
    get :show, params: {id: @exam}
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: {id: @exam}
    assert_response :success
  end

  test "should update exam" do
    patch :update, params: {id: @exam, exam: {name: @exam.name, original_import: @exam.original_import, start: @exam.start}}
    assert_redirected_to exam_path(assigns(:exam))
  end

  test "should destroy exam" do
    assert_difference('Exam.count', -1) do
      delete :destroy, params: {id: @exam}
    end

    assert_redirected_to exams_path
  end
end
