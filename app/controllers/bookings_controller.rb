class BookingsController < ApplicationController
  before_action :find_booking, only: [:approve, :reject]

  def my_bookings
    @bookings = Booking.where(user_id: current_user.id)
  end

  def my_requests
    @user = current_user
    @bookings = Booking.where(seaplane.owner_id: current_user.id)
  end

  def approve
    @booking.approved = true
  end

  def reject
    @booking.approved = false
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
