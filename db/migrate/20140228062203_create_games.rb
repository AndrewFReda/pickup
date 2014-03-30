class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

      t.string :sport
      t.string :location
      t.string :location_name
      t.datetime :date_time 
      t.integer :game_size 
      t.integer :admin_id
      t.timestamps
      
    end
  end
end
