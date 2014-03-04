class Game < ActiveRecord::Base
  has_and_belongs_to_many :players

  def has_player(user)
    players.include? user
  end

  # Returns true if game_size is set and there are less players
  # than game_size associated with this game
  def is_full?
    game_size && (players.count < game_size)
  end

end
