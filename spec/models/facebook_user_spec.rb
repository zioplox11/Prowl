# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  username            :string(255)
#  password_digest     :string(255)
#  height              :string(255)
#  sexual_orientation  :string(255)
#  body_type           :string(255)
#  birthdate           :date
#  age                 :string(255)
#  email               :string(255)
#  gender              :string(255)
#  borough             :string(255)
#  neighborhood        :string(255)
#  admin_status        :boolean          default(FALSE)
#  ethnicity           :string(255)
#  diet                :string(255)
#  drugs               :string(255)
#  drinks              :string(255)
#  smokes              :string(255)
#  zodiac_sign         :string(255)
#  education           :string(255)
#  job                 :string(255)
#  income              :string(255)
#  relationship_status :string(255)
#  relationship_type   :string(255)
#  children_family     :string(255)
#  languages           :string(255)
#  pets                :string(255)
#  self_summary        :text
#  looking_for         :string(255)
#  profile_image_url   :text             default("assets/User_Picture_Placeholder.png")
#  created_at          :datetime
#  updated_at          :datetime
#  fb_token            :string(255)
#  fb_expiration       :integer
#  zip                 :integer
#

require 'spec_helper'

describe FacebookUser do
  pending "add some examples to (or delete) #{__FILE__}"
end
