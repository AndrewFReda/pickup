class GamesController < ApplicationController

  def index
    @games = Game.all
  end
  
  def show
    # TODO: This should use game_params for strong parameters
    @game = Game.find params[:id]
  end

  def new
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
    binding.pry
    if @game.update game_params 
      redirect_to url_for(controller: :players, action: :manage_games, id: @game.admin_id)
    else
      render edit_game_path
    end
  end

  def location
    @games = Game.all
    @hash = Gmaps4rails.build_markers(@games) do |game, marker|
      marker.lat game.location.lat
      marker.lng game.location.lng
    end
  end

  private
  def game_params
    params.require(:game).permit(:sport, :location, :date_time, :game_size, :admin_id, :player_ids => [])
  end

end
