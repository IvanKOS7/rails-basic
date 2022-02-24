class SessionsController < ApplicationController



  def new
  end

  def create

    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:last_path] || tests_path
      cookies.delete :last_path
    else
      flash_helper(:alert)# = ApplicationHelper::FLASH_HELPER[:alert]
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

end
