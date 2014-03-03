class Game < ActiveRecord::Base
  has_and_belongs_to_many :players

  # Returns true if game_size is set and there are less players
  # than game_size associated with this game
  def is_full?
    game_size && (players.count < game_size)
  end

  def to_s
    date = "#{date_time.day}/#{date_time.month}"
    time = "#{date_time.hour}:#{date_time.min}"
    "#{time} on #{date} @ #{location}"
  end

end
