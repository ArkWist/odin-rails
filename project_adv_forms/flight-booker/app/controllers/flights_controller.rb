class FlightsController < ApplicationController
  def show
  end

  def index
    @airports        = Airport.all.map{ |a| a.code }
    @flight_dates    = Flight.distinct.pluck('date(start_time)')
    @passenger_count = 1..4
    
    if params[:flight]
      @flights = Flight.where(origin_id:      params[:flight][:origin_id],
                              destination_id: params[:flight][:destination_id],
                              start_time:     params[:flight][:date].to_date.beginning_of_day..params[:flight][:date].to_date.end_of_day)
                              
                              #'start_time BETWEEN ? AND ?', params[:flight][:date].beginning_of_day, params[:flight][:date].end_of_day)
                              
                              
                              
                              
                              #start_time:     params[:flight][:date].to_date)
      puts "DATETIME: #{params[:flight][:date].to_date}"
      puts "FLIGHT DATA: #{Flight.first.start_time}"
    end

  end
end
