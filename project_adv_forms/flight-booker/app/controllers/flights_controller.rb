class FlightsController < ApplicationController
  def show
  end

  def index
    @airports        = Airport.all.map{ |a| a.code }
    @flight_dates    = Flight.distinct.pluck('date(start_time)')
    @passenger_count = 1..4
    
    if params[:flight]
      @flights = Flight.where(origin_id:      params[:flight][:origin],
                              destination_id: params[:flight][:destination],
                              start_time:     params[:flight][:date].to_date)
      puts "DATETIME: #{params[:flight][:date].to_date}"
      puts "FLIGHT DATA: #{Flight.first.start_time}"
    end

  end
end
