class ApplicationController < ActionController::Base

  helper_method :set_cookie_last_path

  private

  def set_cookie_last_path
    cookies[:last_path] = {
    value: request.path
    }
  end
end
