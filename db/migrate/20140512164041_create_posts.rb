class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
        t.string      :image_url
        t.string      :title
        t.text         :body
        t.integer    :user_id
        t.string      :posting_category
        t.timestamps
    end
  end
end
