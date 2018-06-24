require 'test_helper'

class AirportTest < ActiveSupport::TestCase
  
  def setup
    @airport = airports(:narita)
  end
  
  test "should be valid" do
    assert @airport.valid?
  end
  
  test "iata should be present" do
    @airport.iata = "   "
    assert_not @airport.valid?
  end
  
end
