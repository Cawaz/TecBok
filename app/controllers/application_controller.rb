class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :authorize_basic

  def configure_permitted_parameters
    added_attrs = %i[username email avatar password password_confirmation]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  # 例外ハンドル
  rescue_from ActiveRecord::RecordNotFound,     with: :_render_404
  rescue_from ActionController::RoutingError,   with: :_render_404

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

  def authorize_basic
    return unless Rails.env.production?
    authenticate_or_request_with_http_basic('BA') do |name, password|
      name == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASS']
    end
  end
end
