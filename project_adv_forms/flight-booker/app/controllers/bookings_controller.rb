class BookingsController < ApplicationController
  
  def new
    @flight          = Flight.find(params[:flight_id])
    @passenger_count = params[:passengers].to_i
    @booking         = Booking.new
    @passenger_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:success] = "Flight booked!"
      redirect_to @booking
    else
      @flight = Flight.find(params[:booking][:flight_id])
      flash.now[:danger] = "Please enter valid passenger information."
      render 'new'
    end
  end
  
  def show
    @booking = Booking.find(params[:id])
  end
  
  private
  
    def booking_params
      params.require(:booking).permit(:flight_id, passenger_attributes: [:name, :email])
    end
  
end
