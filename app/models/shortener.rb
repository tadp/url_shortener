class Shortener < ActiveRecord::Base

  def save_and_process
  	generate_token
  	self.short_url = 'https://f35.herokuapp.com/' + self.token.to_s
  	self.save
  end

  def generate_token
  	self.token = SecureRandom.urlsafe_base64(n=2)
  end
end