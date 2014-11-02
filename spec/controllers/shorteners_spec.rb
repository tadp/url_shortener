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

	  it "creates a new shortener if a shortener is not found" do
			post :create, long_url: 'www.example.com'
			expect(Shortener.count).to eq(1)
	  end
	end

	describe "GET show" do
		it "returns an instance of a shortener" do
			@shortener = FactoryGirl.create(:shortener)
			get :show, id: @shortener.id
			expect(@shortener).to be_instance_of Shortener
	  end
	end

end