class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  include Pundit

  before_action :store_user_location!, if: :storable_location?

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :photo])

    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :photo])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

 def storable_location?
   request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
 end

 def store_user_location!
   store_location_for(:user, request.fullpath)
 end
end
