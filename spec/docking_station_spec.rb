require 'docking_station'
describe DockingStation do
  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { double(:bike) }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end

  describe 'initialization' do
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock(double(:bike)) }
      expect{ docking_station.dock(double(:bike)) }.to raise_error 'Docking station full'
    end
  end

  it {is_expected.to respond_to :release_bike }
    # is_expected is defined simply as expect(subject)
    # the subject is instances of the DockingStation class
    # the test is testing if instances respond to the method release_bike

    let(:bike) { double(:bike) }
    it 'releases working bikes' do
      allow(bike).to receive(:working?).and_return(true)
      allow(bike).to receive(:broken?).and_return(false)
      subject.dock(bike)
      released_bike = subject.release_bike
      expect(released_bike).to be_working
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    # it { is_expected.to respond_to(:bikes) }

    it 'docks something' do
      bike = double(:bike)
      # we want to return the bike we dock
      expect(subject.dock(bike)).to eq [bike]
    end

    # it 'returns docked bikes' do
      # bike = Bike.new
      # subject.dock(bike)
      # Again we need to return the bike we just docked
      # expect(subject.bikes.pop).to eq bike
    # end
      # let's upgrade our syntax, to:
      # use a '#' before a method name
      # to imply that it is an instance
      # method. Also look: nested describes!
    describe '#release_bike' do
      let(:bike) { double(:bike) }
      it 'releases a bike' do
      allow(bike).to receive(:broken?).and_return(false)
      subject.dock(bike)
      # we want to release the bike we docked
      expect(subject.release_bike).to eq bike
      end

      it 'raises an error when there are no bikes available' do
        # Let's not dock a bike first:
        # remember subject = DockingStation.new
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end

      it 'raises an error when there are no working bikes available' do
        allow(bike).to receive(:report_broken).and_return(true)
        allow(bike).to receive(:broken?).and_return(true)
        bike.report_broken
        subject.dock(bike)
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end

      it 'it should not return bikes that are broken' do
        bike1 = double(:bike, broken?: false)
        bike2 = double(:bike, report_broken: true, broken?: true)
        bike2.report_broken
        subject.dock(bike1)
        subject.dock(bike2)
        expect(subject.release_bike).to eq bike1
      end
    end

    describe '#dock' do
      it 'raises an error when full' do
        subject.capacity.times { subject.dock double(:bike) }
        expect { subject.dock double(:bike) }.to raise_error 'Docking station full'
      end
    end

end
