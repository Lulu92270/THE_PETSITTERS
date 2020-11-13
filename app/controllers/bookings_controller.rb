class BookingsController < ApplicationController
  before_action :set_pet

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

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

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
