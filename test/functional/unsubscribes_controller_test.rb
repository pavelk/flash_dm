require 'test_helper'

class UnsubscribesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unsubscribes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unsubscribe" do
    assert_difference('Unsubscribe.count') do
      post :create, :unsubscribe => { }
    end

    assert_redirected_to unsubscribe_path(assigns(:unsubscribe))
  end

  test "should show unsubscribe" do
    get :show, :id => unsubscribes(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => unsubscribes(:one).id
    assert_response :success
  end

  test "should update unsubscribe" do
    put :update, :id => unsubscribes(:one).id, :unsubscribe => { }
    assert_redirected_to unsubscribe_path(assigns(:unsubscribe))
  end

  test "should destroy unsubscribe" do
    assert_difference('Unsubscribe.count', -1) do
      delete :destroy, :id => unsubscribes(:one).id
    end

    assert_redirected_to unsubscribes_path
  end
end
