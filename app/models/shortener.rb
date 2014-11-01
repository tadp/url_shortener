class Shortener < ActiveRecord::Base

  def save_and_process
  	generate_token
  	self.short_url = 'a2a.herokuapp.com/s/' + self.token.to_s
  	self.save
  end

  def generate_token
  	self.token = SecureRandom.urlsafe_base64(n=5)
  end
end