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

end
