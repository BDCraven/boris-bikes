require './lib/docking_station'
#require "docking_station.rb"
require './lib/bike'

p station = DockingStation.new
p bike = Bike.new
p bike.report_broken
p station.dock(bike)
p

p van = Van.new
p van.take_bikes(station)
p van.bikes 
