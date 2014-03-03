class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

      t.string :sport
      t.string :location
      t.datetime :date_time 
      t.integer :game_size 
      t.timestamps
      
    end
  end
end
