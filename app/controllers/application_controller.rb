class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :email, :password, :current_password)
    end
  end

  def page_not_found
    respond_to do |format|
      format.html { render(template: 'errors/not_found_error', layout: 'layouts/application', status: 404) }
      format.all  { render(nothing: true, status: 404) }
    end
  end
end
