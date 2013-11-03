class SessionsController < Devise::SessionsController

  skip_after_filter :verify_authorized
  
  def create
    resource = User.find_for_database_authentication(email: params[:user][:email])
    return failure unless resource
    return failure unless resource.valid_password?(params[:user][:password])
    return render :json => {:success => true, :email => resource.email, :token => resource.ensure_authentication_token}
  end
 
  def failure
    return render :json => {:success => false, :errors => ["Login failed."]}
  end

end