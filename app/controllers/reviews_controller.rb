class ReviewsController < ApplicationController
before_action :set_session

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.session = @session
    @review.user_id = current_user
    if @review.save
      redirect_to session_path(@session), notice: 'Your review was created!'
    else
      render 'sessions/show'
    end
  end

  def show

  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

  def set_session
    @session = Session.find(params[:session_id])
  end

end
