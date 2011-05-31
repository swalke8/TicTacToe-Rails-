class PlayerMovesController < ApplicationController

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
