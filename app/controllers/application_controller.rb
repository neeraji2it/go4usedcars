class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :get_layout

  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation,:name) }
  end

  def  after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
     admin_dashboards_path
    elsif resource_or_scope.is_a?(User)
     admin_dashboards_path
    end
  end

   def  after_sign_out_path_for(resource_or_scope)
    root_url
   end

   protected

  def get_layout
     if devise_controller? && (resource_name == :admin || resource_name == :user)
      "admin"
    elsif self.class.parent == Admin
      "admin"
    else
      "application"
    end
  end
end