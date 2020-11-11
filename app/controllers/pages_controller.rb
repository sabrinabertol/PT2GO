class PagesController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :email, :pt])

    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :email, :pt, :specialty])
  end

  def home
  end
end
