require 'jsonizer'
require 'cloud_miner'

# Updates our data with most current from NOAA databases
CloudMiner.mine

puts "Refreshing Earthquakes..."
before = Earthquake.all.count
Earthquake.delete_all
earthquakes = Jsonizer.jsonize_earthquakes
earthquakes.each do |a|
  Earthquake.create!(
    usgs_id: a['I_D'],
    tsunami: !a['FLAG_TSUNAMI'].nil?,
    year: a['YEAR'],
    month: a['MONTH'],
    day: a['DAY'],
    hour: a['HOUR'],
    minute: a["MINUTE"],
    second: a["SECOND"],
    focal_depth: a['FOCAL_DEPTH'],
    eq_primary: a['EQ_PRIMARY'],
    eq_mag_mw: a['EQ_MAG_MW'],
    eq_mag_ms: a['EQ_MAG_MS'],
    eq_mag_mb: a['EQ_MAG_MB'],
    eq_mag_ml: a['EQ_MAG_ML'],
    eq_mag_mfa: a['EQ_MAG_MFA'],
    eq_mag_unk: a['EQ_MAG_UNK'],
    intensity: a['INTENSITY'],
    country: a['COUNTRY'],
    state: a['STATE'],
    location: a['LOCATION_NAME'],
    latitude: a['LATITUDE'],
    longitude: a['LONGITUDE'],
    region_code: a['REGION_CODE'],
    houses_damaged: a['HOUSES_DAMAGED'],
    houses_damaged_description: a['HOUSES_DAMAGED_DESCRIPTION'],
    total_houses_damaged: a['TOTAL_HOUSES_DAMAGED'],
    total_houses_damaged_description: a['TOTAL_HOUSES_DAMAGED_DESCRIPTION'],
    death_count: a['DEATHS'],
    death_description: a['DEATHS_DESCRIPTION'],
    missing_count: a['MISSING'],
    missing_description: a['MISSING_DESCRIPTION'],
    injury_count: a['INJURIES'],
    injury_description: a['INJURIES_DESCRIPTION'],
    damage_cost: a['DAMAGE_MILLIONS_DOLLARS'],
    damage_description: a['DAMAGE_DESCRIPTION'],
    houses_destroyed: a['HOUSES_DESTROYED'],
    houses_destroyed_description: a['HOUSES_DESTROYED_DESCRIPTION'],
    total_deaths: a['TOTAL_DEATHS'],
    total_deaths_description: a['TOTAL_DEATHS_DESCRIPTION'],
    total_missing: a['TOTAL_MISSING'],
    total_missing_description: a['TOTAL_MISSING_DESCRIPTION'],
    total_injuries: a['TOTAL_INJURIES'],
    total_injuries_description: a['TOTAL_INJURIES_DESCRIPTION'],
    total_damage_cost: a['TOTAL_DAMAGE_MILLIONS_DOLLARS'],
    total_damage_description: a['TOTAL_DAMAGE_DESCRIPTION'],
    total_houses_destroyed: a['TOTAL_HOUSES_DESTROYED'],
    total_houses_destroyed_description: a['TOTAL_HOUSES_DESTROYED_DESCRIPTION']
  )
end
after = Earthquake.all.count
puts "   " + (after - before).to_s + " earthquakes added"

puts "Refreshing Eruptions..."
before = Eruption.all.count
Eruption.delete_all
eruptions = Jsonizer.jsonize_eruptions
eruptions.each do |a|
  Eruption.create!(
    year: a['Year'],
    month: a['Month'],
    day: a['Day'],
    tsunami: a['TSU'].eql?("TSU"),
    earthquake: a['EQ'].eql?("EQ"),
    name: a['Name'],
    location: a['Location'],
    country: a['Country'],
    latitude: a['Latitude'],
    longitude: a['Longitude'],
    elevation: a['Elevation'],
    eruption_type: a['Type'],
    status: a['Status'],
    time: a['Time'],
    vei: a['VEI'],
    agent: a['Agent'],
    death_count: a['DEATHS'],
    death_description: a['DEATHS_DESCRIPTION'],
    missing_count: a['MISSING'],
    missing_description: a['MISSING_DESCRIPTION'],
    injury_count: a['INJURIES'],
    injury_description: a['INJURIES_DESCRIPTION'],
    damage_cost: a['DAMAGE_MILLIONS_DOLLARS'],
    damage_description: a['DAMAGE_DESCRIPTION'],
    houses_destroyed: a['HOUSES_DESTROYED'],
    houses_destroyed_description: a['HOUSES_DESTROYED_DESCRIPTION'],
    total_deaths: a['TOTAL_DEATHS'],
    total_deaths_description: a['TOTAL_DEATHS_DESCRIPTION'],
    total_missing: a['TOTAL_MISSING'],
    total_missing_description: a['TOTAL_MISSING_DESCRIPTION'],
    total_injuries: a['TOTAL_INJURIES'],
    total_injuries_description: a['TOTAL_INJURIES_DESCRIPTION'],
    total_damage_cost: a['TOTAL_DAMAGE_MILLIONS_DOLLARS'],
    total_damage_description: a['TOTAL_DAMAGE_DESCRIPTION'],
    total_houses_destroyed: a['TOTAL_HOUSES_DESTROYED'],
    total_houses_destroyed_description: a['TOTAL_HOUSES_DESTROYED_DESCRIPTION']
  )
end
after = Eruption.all.count
puts "   " + (after - before).to_s + " eruptions added"

puts 'Done!'
