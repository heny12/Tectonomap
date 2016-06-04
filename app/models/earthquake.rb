class Earthquake < ActiveRecord::Base

	def self.points()
		points = []
		eqs = Earthquake
			.all
			.pluck(:eq_primary, :latitude, :longitude, :id, :year)
		eqs.each do |earthquake|
			points.push({
				'eq_primary' => earthquake[0],
				'latitude' => earthquake[1].to_s,
				'longitude' => earthquake[2].to_s,
				'id' => earthquake[3],
				'year' => earthquake[4]
			})
		end
		return points
	end

	def self.fetch(id)
		Earthquake.find(id).attributes
	end

end
