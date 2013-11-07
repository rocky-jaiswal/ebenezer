class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include Pundit

  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  after_filter :verify_authorized, :except => [:greet]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  private
    
  def authenticate_user_from_token!
    user_token = request.headers["token"]
    encrypted_email = request.headers["email"]

    auth_service = Authentication.new
    user = auth_service.get_user_from_encrypted_email(encrypted_email)
    if auth_service.valid_token?(user, user_token)
      sign_in user, store: false
    end
  end

  def user_not_authorized
    current_user.logout
    render :nothing => true, :status => :unauthorized
  end

end
