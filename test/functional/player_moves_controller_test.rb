require 'test_helper'

class PlayerMovesControllerTest < ActionController::TestCase
  setup do
    @player_move = player_moves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_moves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_move" do
    assert_difference('PlayerMove.count') do
      post :create, :player_move => @player_move.attributes
    end

    assert_redirected_to player_move_path(assigns(:player_move))
  end

  test "should show player_move" do
    get :show, :id => @player_move.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @player_move.to_param
    assert_response :success
  end

  test "should update player_move" do
    put :update, :id => @player_move.to_param, :player_move => @player_move.attributes
    assert_redirected_to player_move_path(assigns(:player_move))
  end

  test "should destroy player_move" do
    assert_difference('PlayerMove.count', -1) do
      delete :destroy, :id => @player_move.to_param
    end

    assert_redirected_to player_moves_path
  end
end
