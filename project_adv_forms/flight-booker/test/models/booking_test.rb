require 'test_helper'

class BookingTest < ActiveSupport::TestCase

  def setup
    flight = Flight.new(origin:      airports(:heathrow),
                        destination: airports(:narita),
                        start_time:  Date.new(2017,8,15,12,0,0),
                        duration:    10.hours.to_i)
    @booking = Booking.new(flight: flight)
  end
  
  test "should be valid" do
    assert @booking.valid?
  end
  
end
