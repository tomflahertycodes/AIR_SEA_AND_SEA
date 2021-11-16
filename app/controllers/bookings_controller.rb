class BookingsController < ApplicationController
  before_action :find_booking, only: [:approve, :reject]

  def new
    @booking = Booking.new
  end

  def create
    @seaplane = Seaplane.find(params[:id])
    @booking = Booking.new(booking_params)
    if @booking.save!
      redirect_to seaplanes_path(@seaplane)
    else
      redirect_to bookings_path
    end
  end

  def my_bookings
    @bookings = Booking.where(user_id: current_user.id)
  end

  def my_requests
    @user = current_user
    # @bookings = Booking.where(seaplane.user_id: current_user.id)
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

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :seaplane_id, :user_id)
  end
end
