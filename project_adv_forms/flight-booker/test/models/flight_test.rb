require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  
  def setup
    origin      = airports(:heathrow)
    destination = airports(:narita)
    @flight     = Flight.new(origin:      origin,
                             destination: destination,
                             start_time:  DateTime.new(2017,8,15,12,0,0),
                             duration:    10.hours.to_i)
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
  
  test "start time should be present" do
    @flight.start_time = nil
    assert_not @flight.valid?
  end
  
  test "duration should be present" do
    @flight.duration = nil
    assert_not @flight.valid?
  end
  
  test "duration should be positive" do
    @flight.duration = -1 * @flight.duration
    assert_not @flight.valid?
  end
  
  
  
end
