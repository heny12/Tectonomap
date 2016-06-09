class CreateFrequencyTiles < ActiveRecord::Migration
  def change
    create_table :frequency_tiles do |t|
      t.string :tile_type 
      t.decimal :frequency
      t.decimal :latitude_hi
      t.decimal :latitude_lo
      t.decimal :longitude_hi
      t.decimal :longitude_lo

      t.timestamps null: false
    end
  end
end
