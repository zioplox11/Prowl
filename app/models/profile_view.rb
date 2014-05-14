# == Schema Information
#
# Table name: profile_views
#
#  id               :integer          not null, primary key
#  viewer_id        :integer
#  viewed_id        :integer
#  last_time_viewed :datetime
#  created_at       :datetime
#  updated_at       :datetime
#

class ProfileView < ActiveRecord::Base
  belongs_to  :viewer,
                    :class_name => 'User',
                    :foreign_key => 'viewer_id'
  belongs_to  :viewed,
                  :class_name => 'User',
                  :foreign_key => 'viewed_id'


end
