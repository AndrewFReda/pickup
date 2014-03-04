class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def show
    @player = Player.find params[:id]
  end

  def new
    @player = Player.new
  end

  def edit
    @player = Player.find params[:id]
  end

  def update
    @player = Player.find params[:id]
    if @player.update player_params
      redirect_to player_path
    else
      render edit_player_path
    end
  end

  def leave_game
    @player = Player.find params[:id]
    @player.leave_game params[:game_id]
    redirect_to edit_player_path
  end

  def join_game
    @player = Player.find params[:id]
    @player.join_game params[:game_id]
    redirect_to games_path
  end

  private
  def player_params
    params.require(:player).permit(:name, :skill, :game_ids => [])
  end
  
end
