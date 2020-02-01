class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scope, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorzed
  def user_not_authorized
    flash[:alert] = "You are authorized to preform this action."
    redirect_to(root_path)
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(active_)?admin)|(^pages$)/
  end
end
