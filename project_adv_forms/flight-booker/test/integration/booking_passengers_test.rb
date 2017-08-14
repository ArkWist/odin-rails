require 'test_helper'

class BookingPassengersTest < ActionDispatch::IntegrationTest
  
  def setup
    @flight = flights(:nrt_to_lhr_morn)
    @june   = passengers(:june)
    @ace    = passengers(:ace)
  end
  
  test "booking page" do
  end
  
  test "should reject bad flight" do
  end
  
  test "should reject bad passengers" do
  end
  
  test "should create valid booking" do
    get bookings_path
    assert_difference 'Booking.count', 1 do
      post bookings_path, params: { booking: { flight_id: @flight.id } }
    end
  end
  
  
  
end
