class CreateEarthquakes < ActiveRecord::Migration
  def change
    create_table :earthquakes do |t|
      t.integer :usgs_id
      t.boolean :tsunami
      t.integer :year
      t.integer :month
      t.integer :day
      t.integer :hour
      t.integer :minute
      t.integer :second
      t.integer :focal_depth
      t.decimal :eq_primary
      t.decimal :eq_mag_mw
      t.decimal :eq_mag_ms
      t.decimal :eq_mag_mb
      t.decimal :eq_mag_ml
      t.decimal :eq_mag_mfa
      t.decimal :eq_mag_unk
      t.integer :intensity
      t.string :country
      t.string :state
      t.string :location
      t.decimal :latitude
      t.decimal :longitude
      t.integer :region_code
      t.integer :houses_damaged
      t.integer :houses_damaged_description
      t.integer :total_houses_damaged
      t.integer :total_houses_damaged_description
      t.integer :death_count
      t.integer :death_description
      t.integer :missing_count
      t.integer :missing_description
      t.integer :injury_count
      t.integer :injury_description
      t.integer :damage_cost
      t.integer :damage_description
      t.integer :houses_destroyed
      t.integer :houses_destroyed_description
      t.integer :total_deaths
      t.integer :total_deaths_description
      t.integer :total_missing
      t.integer :total_missing_description
      t.integer :total_injuries
      t.integer :total_injuries_description
      t.integer :total_damage_cost
      t.integer :total_damage_description
      t.integer :total_houses_destroyed
      t.integer :total_houses_destroyed_description

      t.timestamps null: false
    end
  end
end
