require './lib/docking_station'
#require "docking_station.rb"
require './lib/bike'

p station = DockingStation.new
p bike1 = Bike.new
p bike2 = Bike.new
p bike2.report_broken
p station.dock(bike1)
p station.dock(bike2)
p station.release_bike
