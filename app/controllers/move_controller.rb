class MoveController < ApplicationController

  def index
    load_game
    setup_game_variables
    update if game_in_progress?
    @game.destroy if @observer.game_over?
  end

  def undo
    load_game
    @game.undo_move
    redirect_to('/move/index')
  end

  def update
    @game.update(params[:move_row].to_i, params[:move_column].to_i)
    redirect_to('/move/index')
  end

  def load
    session[:game] = params[:game]
    redirect_to('/move/index')
  end
private

  def load_game
    @game = Game.find(session[:game])
  end

  def setup_game_variables
    @board = Board.new
    @game.load_board(@board)
    @observer = GameObserver.new(@board)
  end

  def game_in_progress?
    !params[:move].nil? && !@observer.game_over?
  end
end
