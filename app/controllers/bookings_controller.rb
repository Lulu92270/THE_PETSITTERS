class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)

    if @booking.save
      redirect_to booking_path(@booking), notice: "New booking on #{@booking.date} registred successfully."
    else
      render :new
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:date, :user_id, :pet_id)
  end
end
