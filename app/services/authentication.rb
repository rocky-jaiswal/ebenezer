class Authentication

  def get_user_from_encrypted_email(encrypted_email)
    if encrypted_email && !encrypted_email.blank?
      user_email = AES.decrypt(encrypted_email, Ebenezer::Application.config.secret_key_base)
      user       = User.find_by_email(user_email)
    end
    user
  end

  def valid_token?(user, user_token)
    user && !user_token.blank? && Devise.secure_compare(user.authentication_token, user_token)
  end

end