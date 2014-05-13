class AddFacebookAndLocationsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fb_token, :string
    add_column :users, :fb_expiration, :integer
    add_column :users, :zip, :integer
  end
end
