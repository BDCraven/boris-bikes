require_relative 'bike'

class DockingStation
  #attr_reader :bike

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if @bikes.empty?
    @bike.pop
  end

  def dock(bike)
    fail 'Docking station full' if @bike.count >= 20
    # we need to return the bike we dock
    # Use an instance variable to store the bike
    # in the 'state' of this instance
    @bike << bike
  end

  # add to bike method to return the bike we docked
  # def bike
  #  @bike
  # end
end
