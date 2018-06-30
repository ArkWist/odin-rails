class BookingsController < ApplicationController
  
  def new
    @flight          = Flight.find(params[:flight_id])
    @passenger_count = params[:passengers].to_i
    @booking         = Booking.new
  end

  def create
  end

  def show
  end
end
