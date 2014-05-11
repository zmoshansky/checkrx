class ApplicationController < ActionController::Base
  protect_from_forgery
  # before_filter :authenticate_user!

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  def after_sign_in_path_for(resource_or_scope)
  	rx_alerts_path
  end

  protected

    def has_pharmacy?
      authenticate_user!
      if current_user.employable.nil?
        redirect_to edit_user_registration_path(current_user), flash: {error: 'You must have a pharmacy to create a RX Alert'}
        return false
      else
        return true
      end
    end
end
