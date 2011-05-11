class PlayerMovesController < ApplicationController
  # GET /player_moves
  # GET /player_moves.xml
  def index
    @player_moves = PlayerMove.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @player_moves }
    end
  end

  # GET /player_moves/1
  # GET /player_moves/1.xml
  def show
    @player_move = PlayerMove.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @player_move }
    end
  end

  # GET /player_moves/new
  # GET /player_moves/new.xml
  def new
    @player_move = PlayerMove.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @player_move }
    end
  end

  # GET /player_moves/1/edit
  def edit
    @player_move = PlayerMove.find(params[:id])
  end

  # POST /player_moves
  # POST /player_moves.xml
  def create
    @player_move = PlayerMove.new(params[:player_move])
    session[:move] = params[:move]

    respond_to do |format|
      if @player_move.save
        format.html { redirect_to('/move/index', :notice => 'Player move was successfully created.') }
        format.xml  { render :xml => @player_move, :status => :created, :location => @player_move }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @player_move.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /player_moves/1
  # PUT /player_moves/1.xml
  def update
    @player_move = PlayerMove.find(params[:id])

    respond_to do |format|
      if @player_move.update_attributes(params[:player_move])
        format.html { redirect_to(@player_move, :notice => 'Player move was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @player_move.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /player_moves/1
  # DELETE /player_moves/1.xml
  def destroy
    @player_move = PlayerMove.find(params[:id])
    @player_move.destroy

    respond_to do |format|
      format.html { redirect_to(player_moves_url) }
      format.xml  { head :ok }
    end
  end
end
