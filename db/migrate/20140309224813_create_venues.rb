class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|

      t.string :name
      t.float :lat
      t.float :lng
      t.belongs_to :game

      t.timestamps
    end
  end
end
