class ApplicationController < ActionController::Base
  protect_from_forgery
  # before_filter :authenticate_user!

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  def after_sign_in_path_for(resource_or_scope)
  	rx_alerts_path
  end
end
