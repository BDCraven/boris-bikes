require_relative 'bike'

class DockingStation
  attr_reader :bike

  def release_bike
    fail 'No bikes available' unless @bike 
    @bike
  end

  def dock(bike)
    # we need to return the bike we dock
    # Use an instance variable to store the bike
    # in the 'state' of this instance
    @bike = bike
  end

  # add to bike method to return the bike we docked
  # def bike
  #  @bike
  # end
end
