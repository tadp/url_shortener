class AddIndexToShortener < ActiveRecord::Migration
  def change
  	add_index :shorteners, :long_url, unique: true
  	add_index :shorteners, :token, unique: true
  end
end
