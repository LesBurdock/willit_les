class Users::SessionsController < Devise::SessionsController
  after_action :remove_notice

  private

  def remove_notice
    flash[:notice] = nil
  end

end
