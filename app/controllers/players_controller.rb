class PlayersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @player = Player.new
  end
  
end
