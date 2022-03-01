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
    #почему-то код ниже не работает
    #admin_tests_path ? resource.is_a?(Admin) : root_path
    if  resource.is_a?(Admin)
      admin_tests_path
    else
      root_path
    end
  end

end
