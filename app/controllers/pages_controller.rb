class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
    @user = current_user
    @user_bookings = Booking.where(user: @user)
  end

  def change_role
    @user = current_user
    @user.role = params[:user][:role]
    @user.save
    redirect_to profile_path(current_user)
  end
end
