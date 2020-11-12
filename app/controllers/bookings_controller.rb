class BookingsController < ApplicationController  
  before_action :set_pet

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.pet = @pet
    @booking.user = current_user

    if @booking.save
      redirect_to pets_path(@pet), notice: "New booking on #{@booking.date} for #{@pet.name} registred successfully."
    else
      render :new
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def bookings_params
    params.require(:booking).permit(:date, :user_id, :pet_id)
  end
end
