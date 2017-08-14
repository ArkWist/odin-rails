class FlightsController < ApplicationController

  def index
    @airports        = Airport.pluck(:code)
    @dates           = unique_dates
    @passenger_count = 1..4
    
    if params[:flight]
      @flights = Flight.where(origin:      Airport.find_by(code: params[:flight][:origin]),
                              destination: Airport.find_by(code: params[:flight][:destination]),
                              start_time:  dept_date.beginning_of_day..dept_date.end_of_day)
    end

  end
  
  private
  
    def unique_dates
      dates = Flight.order(start_time: :asc).distinct.pluck('date(start_time)')
      dates.map { |date| date.to_date.strftime(date_format) }
    end
    
    def dept_date
      date = DateTime.strptime(params[:flight][:date], date_format)
    end
  
    def date_format
      Flight.date_format
    end
    
end
