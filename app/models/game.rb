class Game < ActiveRecord::Base
  has_and_belongs_to_many :players, uniq: true
  has_one :venue

  before_save :set_game_size
  before_save :add_current_player

  def set_game_size
    self.game_size ||= 4
  end

  # Add admin as current player since only admins can create a game
  def add_current_player
    players << Player.find(admin_id)
  end

  def has_player(user)
    players.include? user
  end

  # Returns true if game_size is set and there are less players
  # than game_size associated with this game
  def is_full?
    game_size && (players.count < game_size)
  end

end