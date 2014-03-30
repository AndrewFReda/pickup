class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def show
    # TODO: This should use player_params for strong parameters
    @player = Player.find params[:id]
  end

  def new
    # if there is no current player, then set a new one
    # otherwise redirect past FB sign in
    if current_user && current_user.player
      redirect_to url_for(controller: :players, action: :lobby, id: @current_user.player.id)
    else
      @player = Player.new
    end
  end

  def edit
    # TODO: This should use player_params for strong parameters
    @player = Player.find params[:id]
  end

  def update
    # TODO: This should use player_params for strong parameters
    @player = Player.find params[:id]
    if @player.update player_params
      redirect_to player_path
    else
      render edit_player_path
    end
  end

  def leave_game
    # TODO: This should use player_params for strong parameters
    @player = Player.find params[:id]
    @player.leave_game params[:game_id]
    redirect_to url_for(action: :manage_games, id: @player.id)
  end

  def join_game
    # TODO: This should use player_params for strong parameters
    @player = Player.find params[:id]
    @player.join_game params[:game_id]
    redirect_to games_path
  end

  def manage_games
    # TODO: This should use player_params for strong parameters
    @player = Player.find params[:id]
  end

  def lobby
    # TODO: This should use player_params for strong parameters
    @player = Player.find params[:id]
  end

  private
  def player_params
    params.require(:player).permit(:id, :name, :skill, :game_ids => [])
  end
  
end
