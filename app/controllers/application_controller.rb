class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    added_attrs = %i[username email password password_confirmation]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
