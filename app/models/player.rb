class Player < ActiveRecord::Base
  has_and_belongs_to_many :games


  def leave_game(game_id)
    games.delete game_id
  end

  def join_game(game_id)
    game = Game.find game_id
    games.push game
  end

end
