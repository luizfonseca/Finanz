class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_session_path, :alert => exception.message
  end
end
