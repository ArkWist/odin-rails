class FlightsController < ApplicationController

  def index
    @airports   = Airport.pluck(:iata)
    @departures = unique_departures
    @group_cap  = 4
    
    if params[:search]
      @search_results = Flight.where(
        origin:      Airport.find_by(iata: params[:search][:origin]),
        destination: Airport.find_by(iata: params[:search][:destination]),
        departure:   departure_date).order(departure: :asc)
      @passengers = params[:search][:passengers]
    end
    
  end
  
  private
  
    def unique_departures
      departures = Flight.order(departure: :asc).pluck(:departure).map(&:to_date).uniq
      departures.map { |date| date.strftime(Flight.date_format) }
    end
    
    def departure_date
      search_date.beginning_of_day..search_date.end_of_day
    end
    
    def search_date
      date = Time.parse(params[:search][:date])
    end
  
end
