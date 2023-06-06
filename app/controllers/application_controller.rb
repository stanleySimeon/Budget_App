class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def login_path
    devise_url(:login)
  end

  def registrations_path
    devise_url(:registrations)
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "Profile updated successfully"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :icon, :provider, :uid)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :icon, :provider, :uid)
    end
  end
end
