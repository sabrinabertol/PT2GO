class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.session = @session
    if @review.save
      redirect_to session_path(@session) notice: 'Your review was added'
    else
      render :new
    end
  end

  # delete /doses/:id
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to session_path(@review.session), alert: 'Review deleted!'
  end

end
