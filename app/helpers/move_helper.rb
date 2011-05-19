module MoveHelper
  def empty_cell?(row, column)
    @board.is_empty_at?(row, column)
  end

  def game_over?
    @observer.game_over?
  end

  def draw_x?(row, column)
    @board.value_at(row, column) == 1
  end

  def iterate_row
    (1..@board.dimension).each do |row|
      yield(row)
     end
  end

  def iterate_column
    iterate_row { |column| yield(column) }
  end

  def player_ones_turn?
    @board.player_value == 1
  end

  def player_one_won?
    !player_ones_turn?
  end

  def has_winner?
    @observer.has_winner?
  end
end
