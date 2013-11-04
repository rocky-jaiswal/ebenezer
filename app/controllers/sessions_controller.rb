class SessionsController < Devise::SessionsController

  skip_after_filter :verify_authorized
  
  def create
    resource = User.find_for_database_authentication(email: params[:user][:email])
    return failure unless resource
    return failure unless resource.valid_password?(params[:user][:password])
    render :json => {:success => true, :email => resource.email, :token => resource.ensure_authentication_token}
  end
 
  def failure
    render :json => {:success => false, :errors => ["login failed."]}
  end

  def destroy
    current_user.logout
    render :json => {:success => true, :message => "logged out"}
  end

end