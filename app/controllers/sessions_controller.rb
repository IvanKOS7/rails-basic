class SessionsController < ApplicationController

  before_action :set_cookie_last_path

  def new

  end

  def create

    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:last_path]
      cookies.delete :last_path
      #render :new
    else
      flash.now[:alert] = ApplicationHelper::FLASH_HELPER[:alert]
      redirect_to login_path
    end

  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

  def set_cookie_last_path
    cookies[:last_path] = {
    value: request.path,
    expires: 1.hour.from_now
    }
   end



end
