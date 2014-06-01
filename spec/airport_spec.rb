require 'airport'

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land
describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane, land: :plane, take_off: :plane }

  context 'plane storage' do
  	it 'starts off with no planes' do
  		expect(airport.planes).to eq []
  	end
  end
  
  context 'taking off and landing' do
    it 'a plane can land' do
    	expect(plane).to receive(:land)
    	airport.bring_er_in(plane)
    end

    it 'takes up one storage space when it lands' do
    	airport.bring_er_in(plane)
    	expect(airport.plane_count).to eq 1
    end
    
    it 'a plane can take off' do
    	expect(plane).to receive(:take_off)
    	airport.boot_plane(plane)
    end

    it 'stops being in the airport when it does' do
    	airport.bring_er_in(plane)
    	airport.boot_plane(plane)
    	expect(airport.plane_count).to eq 0
    end
  end
  
  context 'traffic control' do
    it 'a plane cannot land if the airport is full' do
    	10.times { airport.bring_er_in(Plane.new)}
    	expect(plane).not_to receive(:land)
    	airport.bring_er_in(plane)
    end
    
    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    context 'weather conditions' do
      it 'a plane cannot take off when there is a storm brewing' do
      end
      
      it 'a plane cannot land in the middle of a storm' do
      end
    end
  end
end