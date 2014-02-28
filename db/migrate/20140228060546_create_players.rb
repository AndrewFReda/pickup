class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|

      t.string :name
      t.string :skill_level
      t.text :playing_location

      t.timestamps
    end
  end
end
