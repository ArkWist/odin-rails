class FlightsController < ApplicationController
  
  def new
  end

  def index
    @airports   = Airport.pluck(:iata)
    @departures = unique_departures
    @group_cap  = 4
    
    if params[:flight]
      @flights = Flight.where(
        origin:      Airport.find_by(iata: params[:flight][:origin]),
        destination: Airport.find_by(iata: params[:flight][:destination]),
        departure:   chosen_date.beginning_of_day..chosen_date.end_of_day)
    end
    
  end
  
  private
  
    def unique_departures
      departures = Flight.order(departure: :asc).pluck(:departure).map(&:to_date).uniq
      departures.map { |date| date.strftime(Flight.date_format) }
    end
    
    def chosen_date
      puts params[:flight][:date]
      #departure = Time.strptime(params[:flight][:date], '%d-%m-%Y')
      date = Time.parse(params[:flight][:date])
    end
  
end
