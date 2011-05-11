class MoveController < ApplicationController
  def index
    @observer = GameObserver.new(session[:board])
    @computer = MinimaxComputer.new(session[:board], @observer)
    if !params[:move].nil? && !@observer.game_over?
      session[:game].add_move(params[:move][0], params[:move][1], session[:board].player_value)
      session[:board].move(params[:move][0].to_i, params[:move][1].to_i)
    end
    if session[:player_two] == 2 && session[:board].number_of_moves_made!=0
      @computer.move
    end
  end
end
