require 'test_helper'

class TravelsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:travels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create travel" do
    assert_difference('Travel.count') do
      post :create, :travel => { }
    end

    assert_redirected_to travel_path(assigns(:travel))
  end

  test "should show travel" do
    get :show, :id => travels(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => travels(:one).id
    assert_response :success
  end

  test "should update travel" do
    put :update, :id => travels(:one).id, :travel => { }
    assert_redirected_to travel_path(assigns(:travel))
  end

  test "should destroy travel" do
    assert_difference('Travel.count', -1) do
      delete :destroy, :id => travels(:one).id
    end

    assert_redirected_to travels_path
  end
end
