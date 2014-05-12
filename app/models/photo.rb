# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  image_url   :string(255)
#  description :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Photo < ActiveRecord::Base
  belongs_to :user

end
