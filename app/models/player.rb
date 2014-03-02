class Player < ActiveRecord::Base
  has_and_belongs_to_many :games

  def player_params
    params.require(:player).permit(:name, :skill, :game_ids => [])
  end

end
