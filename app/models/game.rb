class Game < ActiveRecord::Base
  validates_presence_of :player_one, :player_two

  has_many :player_moves, :dependent => :destroy

  def update(row, column)
    setup_game_variables
    update_player_moves(row, column) if @board.is_empty_at?(row, column)
  end

  def undo_move
    (player_moves.pop).destroy
    (player_moves.pop).destroy if self.player_two == 2
  end

  def load_board(board)
    player_moves.each { |load_move| board.move(load_move.row, load_move.column, load_move.value) }
  end

  def add_player_move(row, column, value)
    player_moves.create(:row => row, :column => column, :value => value)
  end

  private

  def setup_game_variables
    @board = Board.new
    load_board(@board)
    @observer = GameObserver.new(@board)
    @computer = MinimaxComputer.new(@board, @observer) if self.player_two == 2
  end

  def update_player_moves(row, column)
    make_move(row, column)
    @board.game_history.each do |move|
      stored_moves = PlayerMove.where(:game_id=>self.id, :row=>move.row, :column=>move.column)
      add_player_move(move.row, move.column, move.player_value) if stored_moves.empty?
    end
  end

  def make_move(row, column)
    @board.move(row, column)
    @computer.move if self.player_two == 2 && @board.number_of_moves_made!=0
  end
end
