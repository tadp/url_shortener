class ShortenersController < ApplicationController

	def new
		@shortener = Shortener.new
	end

	def create
		@shortener = Shortener.where(long_url: params[:long_url]).first
		respond_to do |format|
			if @shortener
				format.js { render :show, shortener: @shortener}
				format.html { redirect_to shortener_path(@shortener.id) }
			else
				@shortener = Shortener.new(long_url: params[:long_url])
				if @shortener.save_and_process
					format.js   { render :show, shortener: @shortener }
				  format.html { redirect_to shortener_path(@shortener.id) }
				else
					format.html { redirect_to root_path}
					format.js   { render :error, shortener: @shortener }
				end
			end
		end
	end

	def show
		@shortener = Shortener.find(params[:id])
	end

	def redirect
		@shortener = Shortener.where(token: params[:token]).first
		redirect_to "http://#{@shortener.long_url.to_s}"
	end

end