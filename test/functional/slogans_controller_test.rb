require 'test_helper'

class SlogansControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slogans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slogan" do
    assert_difference('Slogan.count') do
      post :create, :slogan => { }
    end

    assert_redirected_to slogan_path(assigns(:slogan))
  end

  test "should show slogan" do
    get :show, :id => slogans(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => slogans(:one).id
    assert_response :success
  end

  test "should update slogan" do
    put :update, :id => slogans(:one).id, :slogan => { }
    assert_redirected_to slogan_path(assigns(:slogan))
  end

  test "should destroy slogan" do
    assert_difference('Slogan.count', -1) do
      delete :destroy, :id => slogans(:one).id
    end

    assert_redirected_to slogans_path
  end
end
