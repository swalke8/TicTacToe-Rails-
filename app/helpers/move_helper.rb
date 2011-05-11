module MoveHelper
  def empty_cell?(row, column)
    session[:board].is_empty_at?(row, column)
  end

  def game_over?
    @observer.game_over?
  end

  def draw_x?(row, column)
    session[:board].value_at(row,column) == 1
  end

  def iterate_row
    (1..session[:board].dimension).each do |row|
      yield(row)
     end
  end

  def iterate_column
    iterate_row { |column| yield(column) }
  end

  def player_ones_turn?
    session[:board].player_value == 1
  end

  def player_one_won?
    !player_ones_turn?
  end

  def board_full?
    session[:board].full?
  end

  def has_winner?
    @observer.has_winner?
  end
end
