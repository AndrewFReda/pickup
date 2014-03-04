class Player < ActiveRecord::Base
  has_and_belongs_to_many :games


  def leave_game(game_id)
    game = Game.find game_id
    if id == game.admin_id
      Game.destroy game_id
    else
      games.delete game_id
    end
  end

  def join_game(game_id)
    game = Game.find game_id
    games << game
  end

end
