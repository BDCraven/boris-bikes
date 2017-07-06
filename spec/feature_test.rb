require './lib/docking_station'
#require "docking_station.rb"
require './lib/bike'

docking_station = DockingStation.new
bike = Bike.new

p docking_station.dock(bike)
p docking_station.release_bike
