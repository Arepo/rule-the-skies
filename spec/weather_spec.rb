require 'weather'


class WeatherTest; include Weather; end

describe Weather do

	let(:plane) { Plane.new }
	let(:tester) { WeatherTest.new }
	let(:airport) { Airport.new }

# Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
	context 'weather conditions' do
		

		it 'can be stormy' do
			srand 6
			expect(tester).to be_stormy
		end

		it "usually isn't" do
			srand 1
			expect(tester).not_to be_stormy
		end

		it 'a plane cannot take off when there is a storm brewing' do
			airport.bring_er_in(plane)
			srand 6
			expect(plane).not_to be_flying
			airport.banish_plane(plane)
	    end
	      
	    it 'a plane cannot land in the middle of a storm' do
	   	end
    end
end