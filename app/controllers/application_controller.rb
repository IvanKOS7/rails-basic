class ApplicationController < ActionController::Base

  before_action :authenticate_user!, except: [ :feedback ]
  before_action :set_locale
  helper_method :set_cookie_last_path
  include ActionController::Live
  def default_url_options
     { :lang => I18n.default_locale != I18n.locale ? I18n.locale : nil }
  end

  def stream
   
 end

  private

  def set_cookie_last_path
    cookies[:last_path] = {
    value: request.path
    }
  end

  def after_sign_in_path_for(resource)
    resource.admin? ? admin_tests_path : root_path
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
