class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|

      t.string :location
      t.datetime :date_time  
      t.timestamps
      
    end
  end
end
