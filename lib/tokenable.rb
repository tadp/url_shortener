module Tokenable

  def generate_token
    self.token = SecureRandom.urlsafe_base64(n=5)
  end

end