class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Rails.application.routes.url_helpers

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
  end
end
