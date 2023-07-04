class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit::Authorization

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  add_flash_types :error, :success

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorzed
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(active_)?admin)|(^pages$)/
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:password, :pronouns, :birthdate, :nationality, :nickname, :legal_name])
  end
end
