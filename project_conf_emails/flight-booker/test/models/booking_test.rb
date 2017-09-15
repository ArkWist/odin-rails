require 'test_helper'

class BookingTest < ActiveSupport::TestCase

  def setup
    @heathrow_booking = bookings(:heathrow_morning)
  end
  
  test "should be valid" do
    assert @heathrow_booking.valid?
  end
  
end
