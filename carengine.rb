arequire "pry"

class Car
	def initialize(noise, engine)
		@noise=noise
		@engine=engine
		# @carsengine = Enginge.new(noiseengine)
	end

	#binding pry

	def makenoise
		puts @noise + " " + @engine.makenoise
	end


end


class Engine
	def initialize(noise)
		@noise = noise
	end

	def makenoise
		@noise
	end
end


newcar = Car.new("Neeek", Engine.new("bruuuuuoooom"))
newcar.makenoise