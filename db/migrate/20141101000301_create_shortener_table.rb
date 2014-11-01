class CreateShortenerTable < ActiveRecord::Migration
  def change
    create_table :shorteners do |t|
    	t.string :long_url
    	t.string :short_url
    	t.string :token
    	t.timestamps
    end
  end
end
