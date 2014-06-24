class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def login_required
    redirect_to root_url unless current_user
  end

  helper_method :current_user

end
