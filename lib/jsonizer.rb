require 'csv'

class Jsonizer; class << self

  EQ_ATTRIBUTES = [
    "I_D",
    "FLAG_TSUNAMI",
    "YEAR",
    "MONTH",
    "DAY",
    "HOUR",
    "MINUTE",
    "SECOND",
    "FOCAL_DEPTH",
    "EQ_PRIMARY",
    "EQ_MAG_MW",
    "EQ_MAG_MS",
    "EQ_MAG_MB",
    "EQ_MAG_ML",
    "EQ_MAG_MFA",
    "EQ_MAG_UNK",
    "INTENSITY",
    "COUNTRY",
    "STATE",
    "LOCATION_NAME",
    "LATITUDE",
    "LONGITUDE",
    "REGION_CODE",
    "DEATHS",
    "DEATHS_DESCRIPTION",
    "MISSING",
    "MISSING_DESCRIPTION",
    "INJURIES",
    "INJURIES_DESCRIPTION",
    "DAMAGE_MILLIONS_DOLLARS",
    "DAMAGE_DESCRIPTION",
    "HOUSES_DESTROYED",
    "HOUSES_DESTROYED_DESCRIPTION",
    "HOUSES_DAMAGED",
    "HOUSES_DAMAGED_DESCRIPTION",
    "TOTAL_DEATHS",
    "TOTAL_DEATHS_DESCRIPTION",
    "TOTAL_MISSING",
    "TOTAL_MISSING_DESCRIPTION",
    "TOTAL_INJURIES",
    "TOTAL_INJURIES_DESCRIPTION",
    "TOTAL_DAMAGE_MILLIONS_DOLLARS",
    "TOTAL_DAMAGE_DESCRIPTION",
    "TOTAL_HOUSES_DESTROYED",
    "TOTAL_HOUSES_DESTROYED_DESCRIPTION",
    "TOTAL_HOUSES_DAMAGED",
    "TOTAL_HOUSES_DAMAGED_DESCRIPTION"
  ]
  ER_ATTRIBUTES = [
    "Year",
    "Month",
    "Day",
    "TSU",
    "EQ",
    "Name",
    "Location",
    "Country",
    "Latitude",
    "Longitude",
    "Elevation",
    "Type",
    "Status",
    "Time",
    "VEI",
    "Agent",
    "DEATHS",
    "DEATHS_DESCRIPTION",
    "MISSING",
    "MISSING_DESCRIPTION",
    "INJURIES",
    "INJURIES_DESCRIPTION",
    "DAMAGE_MILLIONS_DOLLARS",
    "DAMAGE_DESCRIPTION",
    "HOUSES_DESTROYED",
    "HOUSES_DESTROYED_DESCRIPTION",
    "TOTAL_DEATHS",
    "TOTAL_DEATHS_DESCRIPTION",
    "TOTAL_MISSING",
    "TOTAL_MISSING_DESCRIPTION",
    "TOTAL_INJURIES",
    "TOTAL_INJURIES_DESCRIPTION",
    "TOTAL_DAMAGE_MILLIONS_DOLLARS",
    "TOTAL_DAMAGE_DESCRIPTION",
    "TOTAL_HOUSES_DESTROYED",
    "TOTAL_HOUSES_DESTROYED_DESCRIPTION"
  ]

  def jsonize_earthquakes
    @earthquakes = File.open(Rails.root.join('data','earthquake.tsv'))
    d = []
    header = true
    CSV.foreach(@earthquakes, col_sep: "\t") do |row|
      if header
        header = false
        next
      end
      h = {}
      row.each_with_index do |value,index|
        h[EQ_ATTRIBUTES[index]] = value
      end
      d << h
    end
    return d
  end

  def jsonize_eruptions
    @eruption = File.open(Rails.root.join('data','eruption.tsv'))
    d = []
    header = true
    CSV.foreach(@eruption, col_sep: "\t") do |row|
      if header
        header = false
        next
      end
      h = {}
      row.each_with_index do |value,index|
        h[ER_ATTRIBUTES[index]] = value
      end
      d << h
    end
    return d
  end

end; end
