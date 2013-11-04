module Security
  extend ActiveSupport::Concern

  def ensure_authentication_token
    self.authentication_token = generate_authentication_token
    self.save!
    self.authentication_token
  end

  def logout
    self.authentication_token = ""
    self.save!
  end
 
  private
  
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

end