class Eruption < ActiveRecord::Base

	def self.points(lat_hi=90,lat_lo=-90,long_hi=180,long_lo=-180)
		points = []
		ers = Eruption
			.all
			.pluck(:vei, :latitude, :longitude, :id, :year)
		ers.each do |eruption|
			points.push({
				'vei' => eruption[0],
				'latitude' => eruption[1].to_s,
				'longitude' => eruption[2].to_s,
				'id' => eruption[3],
				'year' => eruption[4]
			})
		end
		return points
	end

	def self.fetch(id)
		Eruption.find(id).attributes
	end

end
