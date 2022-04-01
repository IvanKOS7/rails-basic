class FeedbackController < ApplicationController


  skip_before_action :authenticate_user!, only: [ :index, :create ]
    before_action :find_admin, only: [:create]

  def index

  end

  def create
    message = params[:message]
    if current_user
      user_email = current_user.email
    else
      user_email = params[:email]
    end
    if message.empty?
      flash.now[:alert] = "Message can't be blank"
      render :index
    else
      FeedbackMailer.feedback_send(message, user_email, @admin).deliver_now
      flash.now[:success] = "Message succesffuly created"
      render :index
    end
  end


private

  def find_admin
    @admin = Admin.first
  end

end
