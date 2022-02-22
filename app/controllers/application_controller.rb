class ApplicationController < ActionController::Base


  helper_method :current_user, :logged_in?



  private

  def autheticate_user!
     unless current_user
       redirect_to login_path
     end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end


  # def referer
  #   cookies[:path] = request.path
  #   @all_domains << cookies[:path]
  # end
end
