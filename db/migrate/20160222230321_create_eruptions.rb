class CreateEruptions < ActiveRecord::Migration
  def change
    create_table :eruptions do |t|
      t.integer :year
      t.integer :month
      t.integer :day
      t.boolean :tsunami
      t.boolean :earthquake
      t.string :name
      t.string :location
      t.string :country
      t.decimal :latitude
      t.decimal :longitude
      t.integer :elevation
      t.string :eruption_type
      t.string :status
      t.string :time
      t.integer :vei
      t.string :agent
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
