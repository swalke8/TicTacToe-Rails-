class MoveController < ApplicationController

  def index
    @observer = GameObserver.new(session[:board])
    @computer = MinimaxComputer.new(session[:board], @observer)
    update_board
    session[:game].destroy if @observer.game_over?
  end

private

  def update_board
    if game_in_progress?
      update_cell if empty_cell?
    end
  end

  def game_in_progress?
    !params[:move].nil? && !@observer.game_over?
  end

  def empty_cell?
    session[:board].is_empty_at?(params[:move][0].to_i, params[:move][1].to_i)
  end

  def update_cell
    session[:board].move(params[:move][0].to_i, params[:move][1].to_i)
    @computer.move if session[:player_two] == 2 && session[:board].number_of_moves_made!=0
  end
end
