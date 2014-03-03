class Player < ActiveRecord::Base
  has_and_belongs_to_many :games


  def leave_game(game_id)
    games.delete game_id
  end

end
