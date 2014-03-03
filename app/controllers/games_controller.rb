class GamesController < ApplicationController

  def index
  end
  
  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.players.push current_user.player
    if @game.save
      redirect_to game_path(id: @game.id)
    else
      render new_game_path
    end
  end

  private
  def game_params
    params.require(:game).permit(:sport, :location, :date_time, :game_size, :player_ids => [])
  end

end
