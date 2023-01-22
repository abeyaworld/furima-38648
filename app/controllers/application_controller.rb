class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :authenticate_user!
  before_action :configure_permited_parameters, if: :devise_controller?

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'abeyaworld' && password == 'ef32134'
    end
  end

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day])
  end
end
