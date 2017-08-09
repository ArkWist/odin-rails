class FlightsController < ApplicationController
  def show
  end

  def index
    @airports        = Airport.all.map{ |a| a.code }
    @flight_dates    = Flight.distinct.pluck('date(start_time)')
    @passenger_count = 1..4
    
    #if params[:flight
    #  #@results = Flight.search(params[:origin, :destination, :date])
    #  @results = Flight.search(params[:flight])
    #end
    
  end
end
