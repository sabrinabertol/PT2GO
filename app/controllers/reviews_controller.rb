class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user
    if @review.save
      redirect_to session_path(@session), notice: 'Your booking was created!'
    else
      render :new
    end
  end
  private

   def review_params
    params.require(:review).permit(:session_id, :rating, :description, :user_id)
  end

end
