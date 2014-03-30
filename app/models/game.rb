class Game < ActiveRecord::Base
  has_and_belongs_to_many :players, -> { uniq }
  before_save :set_num_players
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

  # Returns true if num_players is set and there are less players
  # than num_players associated with this game
  def is_full?
    num_players && (players.count < num_players)
  end

  def to_date_time
    if self.when
      DateTime.strptime("#{self.when}", '%s')
    else
      DateTime.new
    end
  end


end