# https://developers.google.com/maps/documentation/javascript/examples/groundoverlay-simple

class Tiler; class << self

	STEP = 10 # degrees of lat/lng intervalS

	def generate_tiles
		FrequencyTile.destroy_all
		(-90..(90-STEP)).step(STEP) do |lat|
			(-180..(180-STEP)).step(STEP) do |lng|
				calculate_earthquakes(lat,lng)
				calculate_eruptions(lat,lng)
			end
		end
	end

	def calculate_earthquakes lat, lng
		earthquakes = Earthquake.where(:latitude => lat..(lat+STEP), :longitude => lng..(lng+STEP))
		count = earthquakes.count
		frequency = 0
		if !(count.eql? 0) # present earthquakes in that range
			first_year = earthquakes.minimum(:year)
			current_year = Date.today.year
			frequency = (count.to_f / (current_year - first_year).to_f).to_f
		end
		FrequencyTile.create(
			tile_type: "earthquake",
			latitude_lo: lat,
			latitude_hi: (lat+STEP),
			longitude_lo: lng,
			longitude_hi: (lng+STEP),
			frequency: frequency
		)
	end

	def calculate_eruptions lat, lng
		eruptions = Eruption.where(:latitude => lat..(lat+STEP), :longitude => lng..(lng+STEP))
		count = eruptions.count
		frequency = 0
		if !(count.eql? 0) # present eruptions in that range
			first_year = eruptions.minimum(:year)
			current_year = Date.today.year
			frequency = count.to_f / (current_year - first_year).to_f
		end
		FrequencyTile.create(
			tile_type: "eruption",
			latitude_lo: lat,
			latitude_hi: (lat+STEP),
			longitude_lo: lng,
			longitude_hi: (lng+STEP),
			frequency: frequency
		)
	end

end; end
