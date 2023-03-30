class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :address])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:role, :address])

    devise_parameter_sanitizer.permit(:sign_in, keys:[:coupon_id])
  end

  def after_sign_in_path_for(resource)
    puts resource
    # store_location = stored_location_for(resource)
    if session[:coupon_id].present?
      coupon_path(session[:coupon_id])
    else
      root_path
    end
  end

  def after_sign_up_path_for(resource)
    raise
  end
end
