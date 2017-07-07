class Van

  def initialize
    @back_of_the_van = []
    @all_the_bikes = []
  end
  def take_bikes(station)

    @all_the_bikes = station.bikes

  end

  def collect_broken_bikes
    @all_the_bikes.map {|bike| @back_of_the_van << bike if bike.broken?}
    @back_of_the_van
  end

end
