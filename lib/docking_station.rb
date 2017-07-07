require_relative 'bike'

class DockingStation
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def all_bikes_broken?
    bikes.all? { |bike| bike.broken? }
  end

  def find_unboken_bike
    bikes.find { |bike| !bike.broken? }
  end


  def release_bike
    fail 'No bikes available' if empty? || all_bikes_broken?
    find_unboken_bike
  end

  def dock(bike)
    fail 'Docking station full' if full? # guard condition
    bikes << bike
    # we need to return the bike we dock
    # Use an instance variable to store the bike
    # in the 'state' of this instance
  end

  # private

  attr_reader :bikes

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end
  # add to bike method to return the bike we docked
#  def bike
#    @bike
#   end
end
