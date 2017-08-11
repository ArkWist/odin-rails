require 'test_helper'

class PassengerTest < ActiveSupport::TestCase
  def setup
    flight = Flight.new(origin:      airports(:heathrow),
                        destination: airports(:narita),
                        start_date:  Date.new(2017,8,15),
                        start_time:  Time.new(12,0,0),
                        duration:    10.hours.to_i)
    booking = Booking.new(flight: flight)
    @passenger = booking.passengers.new(booking: booking,
                                        name:    'June',
                                        email:   'june@example.com')
  end
  
  test "should be valid" do
    assert @passenger.valid?
  end
  
  test "name should be present" do
    @passenger.name = "   "
    assert_not @passenger.valid?
  end
  
  test "email should be present" do
    @passenger.email = "   "
    assert_not @passenger.valid?
  end
  
end
