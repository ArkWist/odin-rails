require 'test_helper'

class PassengerTest < ActiveSupport::TestCase
  def setup
    @june = passengers(:june)
    @ace  = passengers(:ace) 
  end
  
  test "should be valid" do
    assert @june.valid?
  end
  
  test "name should be present" do
    @june.name = "   "
    assert_not @june.valid?
  end
  
  test "email should be present" do
    @june.email = "   "
    assert_not @june.valid?
  end
  
  test "email should be unique" do
    duplicate_passenger = @june.dup
    duplicate_passenger.email = @june.email.upcase
    @june.save
    assert_not duplicate_passenger.valid?
  end
  
  test "email should be lowercase" do
    mixed_case_email = "zErO@eXaMpLe.CoM"
    @june.email = mixed_case_email
    @june.save
    assert_equal mixed_case_email.downcase, @june.reload.email
  end
  
end
