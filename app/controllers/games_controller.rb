class GamesController < ApplicationController

  def index
    @games = Game.all
  end
  
  def show
    # TODO: This should use game_params for strong parameters
    @game = Game.find params[:id]
  end

  def new
    # TODO make when parameter required / figure out how to convert datetime to unix before form sends
    @game = Game.new
  end

  def create
    @game = Game.new game_params
    if @game.save
      redirect_to game_path(id: @game.id)
    else
      render new_game_path
    end
  end

  def edit
    @game = Game.find params[:id]
  end

  def update
    @game = Game.find params[:id]
    if @game.update game_params
      redirect_to url_for(controller: :players, action: :manage_games, id: @game.admin_id)
    else
      render edit_game_path
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
    params.require(:game).permit(:sport, :location, :location_name, :when, :num_players, :admin_id, :player_ids => [])
  end

end
