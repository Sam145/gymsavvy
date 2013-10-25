require 'test_helper'

class ProgramSetsControllerTest < ActionController::TestCase
  setup do
    @program_set = program_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:program_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create program_set" do
    assert_difference('ProgramSet.count') do
      post :create, program_set: {  }
    end

    assert_redirected_to program_set_path(assigns(:program_set))
  end

  test "should show program_set" do
    get :show, id: @program_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @program_set
    assert_response :success
  end

  test "should update program_set" do
    put :update, id: @program_set, program_set: {  }
    assert_redirected_to program_set_path(assigns(:program_set))
  end

  test "should destroy program_set" do
    assert_difference('ProgramSet.count', -1) do
      delete :destroy, id: @program_set
    end

    assert_redirected_to program_sets_path
  end
end
