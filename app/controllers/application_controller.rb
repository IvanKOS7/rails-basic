class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :set_cookie_last_path

  private

  def autheticate_user!
     unless current_user
       set_cookie_last_path
       redirect_to login_path
     end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def set_cookie_last_path
    cookies[:last_path] = {
    value: request.path
    }
  end
end
