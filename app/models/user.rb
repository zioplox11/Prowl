# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string(255)
#  password_digest :string(255)
#  height          :integer
#  body_type       :string(255)
#  birthdate       :date
#  email           :string(255)
#  admin_status    :boolean          default(FALSE)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_secure_password
end
