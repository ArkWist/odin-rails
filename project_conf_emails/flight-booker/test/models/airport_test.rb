require 'test_helper'

class AirportTest < ActiveSupport::TestCase
  
  def setup
    @airport = Airport.new(code: 'CDG')
  end
  
  test "should be valid" do
    assert @airport.valid?
  end
  
  test "code should be present" do
    @airport.code = "   "
    assert_not @airport.valid?
  end
  
  
end
