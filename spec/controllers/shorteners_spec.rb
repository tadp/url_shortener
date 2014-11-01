require 'rails_helper'

describe ShortenersController do
	describe "GET new" do
		it "renders the new template" do
			get :new
			expect(response).to render_template :new
	  end
	end

	describe "POST create" do
		it "redirects to shortener path if an existing shortener is found" do
			@shortener = FactoryGirl.create(:shortener)
			post :create, long_url: @shortener.long_url
			expect(response).to redirect_to shortener_path(@shortener)
	  end
	end
end