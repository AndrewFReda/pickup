class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

      t.string :sport
      t.string :location
      t.string :location_name
      t.integer :num_players 
      t.integer :admin_id
      t.integer :when

      t.timestamps
      
    end
  end
end
