require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  
  def setup
    @origin =      airports(:narita)
    @destination = airports(:frankfurt)
    @depart =      DateTime.new(2018,6,15,12,0,0)
    @flight =      Flight.new(origin:      @origin,
                              destination: @destination,
                              departure:   @depart,
                              arrival:     @depart + 10.hours)
  end
    
  test "should be valid" do
    assert @flight.valid?
  end
  
end
