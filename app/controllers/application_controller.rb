class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :image)
    end
  end
end
