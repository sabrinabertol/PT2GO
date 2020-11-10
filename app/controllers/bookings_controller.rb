class BookingsController < ApplicationController
before_action :set_session, except: [:destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.session = @session
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





class ReviewsController < ApplicationController
  before_action :set_restaurant, except: [:destroy]

  # get /restaurants/:restaurant_id/reviews/new
  def new
    @review = Review.new
  end

  # post '/restaurants/:restaurant_id/reviews'
  # params = { review: { content: '' } }
  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Your review was added!'
      # redirect_to @restaurant
    else
      render :new
    end
  end

  # delete /reviews/:id
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to restaurant_path(@review.restaurant), notice: 'Review removed successfully!'
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :session_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
