require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # Replace this with your real tests.

  def iterate_board
    (0..2).each { |row| (0..2).each { |column| yield(row, column) } }
  end

  def setup
    @game = Game.create!(:player_one => 1, :player_two => 1)
  end

  test "adds a player move" do
    @game.add_player_move(1,1,1)
    assert_equal(@game.player_moves.size, 1)
  end

  test "load board" do
    @board = Board.new
    @board2 = Board.new
    @board.move(1,1)
    @board.move(1,2)
    @game.add_player_move(1,1,1)
    @game.add_player_move(1,2,-1)
    @board2 = @game.load_board
    iterate_board { |row, column| assert_equal(@board.value_at(row, column), @board2.value_at(row, column)) }
  end

  test "undo move" do
    @game.add_player_move(1,1,1)
    @game.undo_move
    assert_equal(@game.player_moves.size, 0)
  end

  test "updates board" do
    @game.update(1,1)
    assert_equal(@game.player_moves.size, 1)
  end

  test "updates will not update if the cell is already taken" do
    @game.add_player_move(1,1,1)
    @game.update(1,1)
    assert_equal(@game.player_moves.size, 1)
  end
end
