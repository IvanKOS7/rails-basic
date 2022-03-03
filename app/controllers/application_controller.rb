class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  helper_method :set_cookie_last_path

  private

  def set_cookie_last_path
    cookies[:last_path] = {
    value: request.path
    }
  end

  def after_sign_in_path_for(resource)
    resource.admin? ? admin_tests_path : root_path
  end

end
