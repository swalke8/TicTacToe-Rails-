class GamesController < ApplicationController
  # GET /games
  # GET /games.xml
  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @games }
    end
  end

  def show
    @game = Game.find(session[:game])
    load_environment
    update if game_in_progress?
    puts "row: #{params[:move_row]} column: #{params[:move_column]}"
  end

  def new
    @game = Game.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @game }
    end
  end

  def create
    @game = Game.new(params[:game])

    respond_to do |format|
      if @game.save
        session[:game] = @game.id
        format.html { redirect_to "/games/show", :notice => 'Game was created successfully!'}
        format.xml  { render :xml => @game, :status => :created, :location => @game }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  def load
    session[:game] = params[:game]
    redirect_to('/games/show')
  end

  def update
    @game.update(params[:move_row].to_i, params[:move_column].to_i)
    redirect_to('/games/show')
  end

  def undo
    @game = Game.find(session[:game])
    @game.undo_move
    redirect_to('/games/show')
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to(games_url) }
      format.xml  { head :ok }
    end
  end

  def destroy_all
    Game.destroy_all
    respond_to do |format|
      format.html { redirect_to(games_url) }
      format.xml  { head :ok }
    end
  end

private

  def load_environment
    setup_game_variables
    @game.destroy if @game.game_over?
  end

  def setup_game_variables
    @board = @game.load_board
    @observer = GameObserver.new(@board)
  end

  def game_in_progress?
    !params[:move].nil? && !@game.game_over?
  end

end
