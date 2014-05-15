# == Schema Information
#
# Table name: posts
#
#  id               :integer          not null, primary key
#  image_url        :string(255)
#  title            :string(255)
#  body             :text
#  user_id          :integer
#  posting_category :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Post < ActiveRecord::Base

  # validations
  validates :body, :title, presence: true

  # associations
  belongs_to :user

end
