class FlightsController < ApplicationController
  def show
  end

  def index
    @airports        = Airport.all.map{ |a| a.code }
    @flight_dates    = Flight.all.map{ |f| f.start_time.to_date }
    @passenger_count = 1..4
  end
end
