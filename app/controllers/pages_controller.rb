class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
    @user = current_user
    @user_bookings = Booking.where(user: current_user)
    @pets = Pet.where(pet_owner: current_user)
  end

  def change_role
    current_user.role = params[:user][:role]
    current_user.save
    redirect_to profile_path(current_user)
  end
end
