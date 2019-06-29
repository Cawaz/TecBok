class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    added_attrs = %i[username email avatar password password_confirmation]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  # 例外ハンドル
  if Rails.env.development?
    rescue_from ActiveRecord::RecordNotFound,     with: :_render_404
    rescue_from ActionController::RoutingError,   with: :_render_404
  end

  def routing_error
    raise ActionController::RoutingError, params[:path]
  end

  private

  def _render_404(e = nil)
    logger.info "Rendering 404 with exception: #{e.message}" if e

    if request.format.to_sym == :json
      render json: { error: '404 error' }, status: :not_found
    else
      render 'errors/404', status: :not_found
    end
  end
end
