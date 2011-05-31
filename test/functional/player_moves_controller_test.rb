require 'test_helper'

class PlayerMovesControllerTest < ActionController::TestCase
  setup do
    @player_move = player_moves(:one)
  end

  test "should destroy player_move" do
    assert_difference('PlayerMove.count', -1) do
      delete :destroy, :id => @player_move.to_param
    end

    assert_redirected_to player_moves_path
  end
end
