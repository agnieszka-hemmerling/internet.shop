require 'test_helper'

class PocztaControllerTest < ActionController::TestCase
  setup do
    @pocztum = poczta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:poczta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pocztum" do
    assert_difference('Pocztum.count') do
      post :create, pocztum: @pocztum.attributes
    end

    assert_redirected_to pocztum_path(assigns(:pocztum))
  end

  test "should show pocztum" do
    get :show, id: @pocztum.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pocztum.to_param
    assert_response :success
  end

  test "should update pocztum" do
    put :update, id: @pocztum.to_param, pocztum: @pocztum.attributes
    assert_redirected_to pocztum_path(assigns(:pocztum))
  end

  test "should destroy pocztum" do
    assert_difference('Pocztum.count', -1) do
      delete :destroy, id: @pocztum.to_param
    end

    assert_redirected_to poczta_path
  end
end
