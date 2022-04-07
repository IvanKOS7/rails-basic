class FeedbackMailer < ApplicationMailer

  def feedback_send(message, user_email, admin_email)
    @message = message
    @user_email = user_email
    @admin_email = admin_email
    mail to: @admin_email.email
  end

end
