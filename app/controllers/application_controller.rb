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
    user_token    = request.headers["token"]
    if !user_token.blank?
      user          = user_token && User.find_by_authentication_token(user_token)
      authenticated = user && user.email == request.headers["email"]
    end
    sign_in user, store: false if authenticated
  end

  def user_not_authorized
    render :nothing => true, :status => :unauthorized
  end

end
