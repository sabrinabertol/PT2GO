class BookingsController < ApplicationController
before_action :set_session, except: [:destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.session = @session
    @booking.user = current_user
    raise
    if @booking.save
      redirect_to session_path(@session), notice: 'Your booking was created!'
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @review.destroy
    redirect_to session_path(@booking.session), notice: 'Booking removed successfully!'
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :session_id)
  end

  def set_session
    @session = Session.find(params[:session_id])
  end
end
