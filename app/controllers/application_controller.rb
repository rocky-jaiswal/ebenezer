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
    user_email = request.headers["email"]
    user       = user_email && User.find_by_email(user_email)

    if user && !user_token.blank? && Devise.secure_compare(user.authentication_token, user_token)
      sign_in user, store: false
    end
  end

  def user_not_authorized
    current_user.logout
    render :nothing => true, :status => :unauthorized
  end

end
