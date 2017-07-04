require 'docking_station'
describe DockingStation do
  it {is_expected.to respond_to :release_bike }
    # is_expected is defined simply as expect(subject)
    # the subject is instances of the DockingStation class
    # the test is testing if instances respond to the method release_bike

    it 'releases working bikes' do
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to(:bike) }

    it 'docks something' do
      bike = Bike.new
      # we want to return the bike we dock
      expect(subject.dock(bike)).to eq bike
    end

    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      #Again we need to return the bike we just docked
      expect(subject.bike).to eq bike
    end 

end
