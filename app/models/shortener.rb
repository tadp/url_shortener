class Shortener < ActiveRecord::Base
	require 'Tokenable'
  include Tokenable

  def save_and_process
  	generate_token
  	self.short_url = 'a2a.herokuapp.com/s/' + self.token.to_s
  	self.save
  end

end