class BookingsController < ApplicationController
  before_action :find_booking, only: [:approve, :reject]

  def create
    @booking = Booking.new(booking_params)
    @booking.seaplane_id = params[:seaplane_id]
    @booking.user = current_user
    if @booking.save!
      redirect_to my_bookings_bookings_path
    end
  end

  def my_bookings
    @bookings = Booking.where(user_id: current_user.id)
    @approved_bookings = @bookings.where(approved: true)
    @rejected_bookings = @bookings.where(approved: false)
    @pending_bookings = @bookings.where(approved: nil)
  end

  def my_requests
    @bookings = Booking.all
    @owner_bookings = @bookings.select do |booking|
      booking.seaplane.user_id == current_user.id && booking.start_date.strftime('%d/%m/%Y') > Date.today.strftime('%d/%m/%Y')
    end
    @active_requests = @owner_bookings.select { |b| b.approved = nil }
    @upcoming_bookings = @owner_bookings.select { |b| b.approved = true }
  end

  def approve
    @booking.update(approved: true)
    redirect_to my_requests_bookings_path
  end

  def reject
    @booking.update(approved: false)
    redirect_to my_requests_bookings_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :seaplane_id, :user_id)
  end
end
