class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ], raise: false

  def index
    @sessions = Session.all
  end

  def show
    @session = Session.find(params[:id])
    @review = Review.new
    @booking = Booking.new
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)

    if @session.save
      redirect_to session_path(@session), notice: "The session <strong>#{@session.name}</strong> was created successfully!"
    else
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:name, :tipo, :description, :location, :date)
  end
end
