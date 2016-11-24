require 'test_helper'

class RefrigeratorsControllerTest < ActionController::TestCase
  setup do
    @refrigerator = refrigerators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:refrigerators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create refrigerator" do
    assert_difference('Refrigerator.count') do
      post :create, refrigerator: { deadline: @refrigerator.deadline, name: @refrigerator.name, public: @refrigerator.public, quantity: @refrigerator.quantity, user_id: @refrigerator.user_id }
    end

    assert_redirected_to refrigerator_path(assigns(:refrigerator))
  end

  test "should show refrigerator" do
    get :show, id: @refrigerator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @refrigerator
    assert_response :success
  end

  test "should update refrigerator" do
    patch :update, id: @refrigerator, refrigerator: { deadline: @refrigerator.deadline, name: @refrigerator.name, public: @refrigerator.public, quantity: @refrigerator.quantity, user_id: @refrigerator.user_id }
    assert_redirected_to refrigerator_path(assigns(:refrigerator))
  end

  test "should destroy refrigerator" do
    assert_difference('Refrigerator.count', -1) do
      delete :destroy, id: @refrigerator
    end

    assert_redirected_to refrigerators_path
  end
end
