class ApplicationController < ActionController::Base
  include ActionController::Serialization
  include DeviseTokenAuth::Concerns::SetUserByToken

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do
    head :forbidden
  end

  def angular
    render 'layouts/application'
  end
  
  private

  def current_ability
    @current_ability ||= Ability.new(current_api_user)
  end
end
