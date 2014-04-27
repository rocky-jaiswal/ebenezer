class AuthenticationService

  def authenticated?(encrypted_email, user_token)
    user = get_user_from_encrypted_email(encrypted_email)
    user if user && valid_token?(user, user_token)
  end

  def get_user_from_encrypted_email(encrypted_email)
    unless encrypted_email.blank?
      user_email = AES.decrypt(encrypted_email, Ebenezer::Application.config.secret_key_base)
      User.find_by_email(user_email)
    end
  end

  def valid_token?(user, user_token)
    user && !user_token.blank? && Devise.secure_compare(user.authentication_token, user_token)
  end

end