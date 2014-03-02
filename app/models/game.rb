class Game < ActiveRecord::Base
  has_and_belongs_to_many :players

  def game_params
    params.require(:game).permit(:location, :date_time, :player_ids => [])
  end
end
