require 'test_helper'

class PuzzlesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:puzzles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create puzzle" do
    assert_difference('Puzzle.count') do
      post :create, :puzzle => { }
    end

    assert_redirected_to puzzle_path(assigns(:puzzle))
  end

  test "should show puzzle" do
    get :show, :id => puzzles(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => puzzles(:one).id
    assert_response :success
  end

  test "should update puzzle" do
    put :update, :id => puzzles(:one).id, :puzzle => { }
    assert_redirected_to puzzle_path(assigns(:puzzle))
  end

  test "should destroy puzzle" do
    assert_difference('Puzzle.count', -1) do
      delete :destroy, :id => puzzles(:one).id
    end

    assert_redirected_to puzzles_path
  end
end
