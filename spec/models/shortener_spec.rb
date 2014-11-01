require 'rails_helper'

describe Shortener do
	describe "#generate_token" do
		it "should generate a random token" do
      shortener = FactoryGirl.create(:shortener)
      shortener.generate_token
			expect(shortener.token).to be_present
	  end
	end

	describe "#save_and_process" do
		it "should save the shortener" do
			shortener = FactoryGirl.build(:shortener, long_url: 'www.longlonglongurl.com')
			shortener.save_and_process
			expect(Shortener.count).to eq(1)
		end

		it "should create a short_url" do
      shortener = FactoryGirl.create(:shortener, long_url: 'www.longlonglongurl.com')
      shortener.save_and_process
			expect(shortener.short_url).to be_present
	  end
	end

end