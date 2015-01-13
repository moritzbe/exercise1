class Car
  attr_reader :noise
    def initialize(noise)
        @noise = noise
    end

     def <=> (other_car)
       @noise.length <=> other_car.noise.length
     end

end

class CarTransport
  include Enumerable

  def initialize
    @garage = []
  end

  def add_car(noise)
    @garage << Car.new(noise)
  end

  def order
    puts @garage.sort!#_by! {|ourcar| ourcar.noise.length}
  end

  #def each(&block)
  #  @garage.each(&block)
  #end

  def printout
    @garage.each { |ourcar| puts ourcar.noise}
  end
end

garage = CarTransport.new
garage.add_car("Brum")
garage.add_car("BROOOOOOM")
garage.add_car("Noisy")
garage.order
garage.printout


