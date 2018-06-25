require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  
  def setup
    origin =      airports(:narita)
    destination = airports(:frankfurt)
    depart =      DateTime.new(2018,6,15,12,0,0)
    @flight =     Flight.new(origin:      origin,
                             destination: destination,
                             departure:   depart,
                             arrival:     depart + 10.hours)
  end
    
  test "should be valid" do
    assert @flight.valid?
  end
  
  test "origin should be present" do
    @flight.origin = nil
    assert_not @flight.valid?
  end
  
  test "destination should be present" do
    @flight.destination = nil
    assert_not @flight.valid?
  end
  
  test "departure should be present" do
    @flight.departure = nil
    assert_not @flight.valid?
  end
  
  test "arrival should be present" do
    @flight.arrival = nil
    assert_not @flight.valid?
  end
  
  test "departure should precede arrival" do
    @flight.arrival = @flight.departure
    assert_not @flight.valid?
  end
  
end
