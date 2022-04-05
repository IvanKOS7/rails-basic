class FeedbackController < ApplicationController


  skip_before_action :authenticate_user!, only: [ :new, :create ]
    before_action :find_admin, only: [:create]

  def new
    #@feedback = FeedbackMailer.new
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
      render :new
    else
      FeedbackMailer.feedback_send(message, user_email, @admin).deliver_now
      flash.now[:notice] = "Message succesffuly created"
      render :new
    end
  end


private

  def find_admin
    @admin = Admin.first
  end

end
