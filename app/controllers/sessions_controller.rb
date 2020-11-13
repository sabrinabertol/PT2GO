class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ], raise: false

  def index
    @sessions = Session.all.order(created_at: :asc)
    @markers = @sessions.geocoded.map do |session|
      {
        lat: session.latitude,
        lng: session.longitude,
        infoWindow:render_to_string(partial: "info_window", locals: { session: session }),
        image_url: helpers.asset_url('bg.jpg')
      }
    end
  end

  def show
    @session = Session.find(params[:id])
    @review = Review.new
    @booking = Booking.new

    @attending = @session.users
    @markers =
      [{
        lat: @session.latitude,
        lng: @session.longitude
      }]
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    @session.user = current_user

    if @session.save
      redirect_to session_path(@session), notice: "The session <strong>#{@session.name}</strong> was created successfully!"
    else
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:name, :tipo, :description, :location, :date, :photo)
  end
end
