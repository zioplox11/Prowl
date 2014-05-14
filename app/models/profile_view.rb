class ProfileView < ActiveRecord::Base
  belongs_to  :viewer,
                    :class_name => 'User',
                    :foreign_key => 'viewer_id'
  belongs_to  :viewed,
                  :class_name => 'User',
                  :foreign_key => 'viewed_id'


end
