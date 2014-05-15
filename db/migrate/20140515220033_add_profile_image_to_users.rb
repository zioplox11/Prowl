class AddProfileImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_image_url, :text
  end
end
