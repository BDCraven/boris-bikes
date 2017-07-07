require 'bike'
require 'docking_station'
require 'van'

describe Van do
  let(:bike) { Bike.new }
  let(:station) { DockingStation.new}
  it {is_expected.to respond_to(:take_bikes)}

  describe '#take_bikes' do
    #let(:bike) { Bike.new }
    #let(:station) { DockingStation.new}
    it 'should take a bike' do
    station.dock(bike)
    expect(subject.take_bikes(station)).to eq [bike]
    end


    it 'should take all broken bikes' do
      bike2 = double(:bike)
      bike1 = double(:bike)
      bike3 = double(:bike)
      allow(bike2).to receive(:broken?).and_return(true)
      allow(bike3).to receive(:broken?).and_return(true)
      allow(bike1).to receive(:broken?).and_return(false)
      station.dock(bike1)
      station.dock(bike2)
      station.dock(bike3)
      expect(subject.take_bikes(station)).to eq [bike1, bike2, bike3]
    end
  end

  describe '#collect_broken_bikes' do

    it 'should take all broken bikes and return all the working bikes' do
      bike1 = double(:bike)
      bike2 = double(:bike)
      bike3 = double(:bike)
      allow(bike2).to receive(:broken?).and_return(true)
      allow(bike3).to receive(:broken?).and_return(true)
      allow(bike1).to receive(:broken?).and_return(false)
      station.dock(bike1)
      station.dock(bike2)
      station.dock(bike3)
      subject.take_bikes(station)
      expect(subject.collect_broken_bikes).to eq [bike2, bike3]
    end
  end
end
