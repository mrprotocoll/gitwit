class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    return unless session[:user_id]

    Current.user = User.find_by(id: session[:user_id])
  end

  def is_user_logged_in?
    Current.user.nil?
  end

  def require_login!
    redirect_to login_path, alert: "Authentication Required" if is_user_logged_in?
  end
end
