require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @morn_flight = Flight.new(origin:      airports(:heathrow),
                              destination: airports(:narita),
                              start_time:  DateTime.new(2017,8,15,1,0,0),
                              duration:    10.hours.to_i)
    @noon_flight = Flight.new(origin:      airports(:heathrow),
                              destination: airports(:narita),
                              start_time:  DateTime.new(2017,8,15,23,45,0),
                              duration:    6.hours.to_i)
  end
  
  test "should get show" do
    get flights_show_url
    assert_response :success
  end

  test "should get index" do
    get flights_index_url
    assert_response :success
  end
  
  test "should find flights by date regardless of time" do
  end

end
