class SessionsController < ApplicationController

  #before_action :save_domain, only: :create

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      #user.authenticate(params[:password]) if user != nil
      session[:user_id] = user.id #rails method
      # last domain
      redirect_to tests_path
    else
      flash.now[:alert] = "Please, check fields"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

  # def save_domain
  #   cookies.permanent[:]
  #   byebug
  #   if logged_in?
  #     redirect_to domains_arr.last
  #     #https://www.allaboutcookies.org/cookies/
  #   end
  # end
end
