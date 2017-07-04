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
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      #Again we need to return the bike we just docked
      expect(subject.bike).to eq bike
    end
      # let's upgrade our syntax, to:
      # use a '#' before a method name
      # to imply that it is an instance
      # method. Also look: nested describes!
    describe '#release_bike' do
      it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      # we want to release the bike we docked
      expect(subject.release_bike).to eq bike
      end

      it 'raises an error when there are no bikes available' do
        # Let's not dock a bike first:
        # remember subject = DockingStation.new
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end
    end

    describe '#dock' do
      it 'raises an error when full' do
        20.times { subject.dock Bike.new }
        expect { subject.dock Bike.new }.to raise_error 'Docking station full'
      end
    end

end
