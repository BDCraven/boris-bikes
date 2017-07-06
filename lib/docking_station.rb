require_relative 'bike'

class DockingStation
  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full? # guard condition
    @bikes << bike
    # we need to return the bike we dock
    # Use an instance variable to store the bike
    # in the 'state' of this instance
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
  # add to bike method to return the bike we docked
#  def bike
#    @bike
#   end
end
