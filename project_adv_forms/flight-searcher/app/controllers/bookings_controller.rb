class BookingsController < ApplicationController
  
  def new
    @flight          = Flight.find(params[:flight_id])
    @passenger_count = params[:passengers].to_i
    @booking         = Booking.new
    @passenger_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.create(booking_params)
    if @booking.save
      flash[:success] = "Flight booked!"
      redirect_to @booking
    else
      flash.now[:danger] = "Invalid passenger information."
      @flight            = Flight.find(params[:booking][:flight_id])
      @passenger_count   = booking_params[:passengers_attributes].to_h.size
      render :new
    end
  end

  def show
    @booking    = Booking.find(params[:id])
    @flight     = Flight.find(@booking.flight_id)
    @passengers = @booking.passengers
    
    @date       = @flight.departure_date
    @time       = @flight.departure_time
    @duration   = @flight.duration
  end
  
  private
  
    def booking_params
      params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end
    
end
