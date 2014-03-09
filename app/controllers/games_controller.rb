class GamesController < ApplicationController

  def index
    @games = Game.all
  end
  
  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_path(id: @game.id)
    else
      render new_game_path
    end
  end

  def location
    @games = Game.all
    @hash = Gmaps4rails.build_markers(@games) do |game, marker|
      lat_lng = game.location.split ','
      marker.lat lat_lng[0].to_f
      marker.lng lat_lng[1].to_f
    end
  end

  private
  def game_params
    params.require(:game).permit(:sport, :location, :date_time, :game_size, :admin_id, :player_ids => [])
  end

end
