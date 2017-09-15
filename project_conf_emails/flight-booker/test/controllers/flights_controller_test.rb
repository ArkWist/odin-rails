require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @nrt_to_lhr_am = flights(:nrt_to_lhr_am)
    @nrt_to_lhr_pm = flights(:nrt_to_lhr_pm)
  end
  
  #test "should get index" do
  #  get flights_index_url
  #  assert_response :success
  #end
  
  test "should find flights by date regardless of time" do
  end

end
