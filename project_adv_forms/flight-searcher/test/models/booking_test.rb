require 'test_helper'

class BookingTest < ActiveSupport::TestCase

  def setup
    @frankfurt_booking = bookings(:frankfurt_morning)
  end
  
  #This should be failing until passengers have been added...
  test "should be valid" do
    assert @frankfurt_booking.valid?
  end
  
end
