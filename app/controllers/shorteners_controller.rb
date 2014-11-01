class ShortenersController < ApplicationController

	def index
		@shorteners = Shortener.all
	end

end