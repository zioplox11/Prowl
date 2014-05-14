class CreateProfileViews < ActiveRecord::Migration
  def change
    create_table :profile_views do |t|
        t.integer    :viewer_id
        t.integer    :viewed_id
        t.datetime  :last_time_viewed
        t.timestamps
    end
  end
end
