# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  username            :string(255)
#  password_digest     :string(255)
#  height              :integer
#  body_type           :string(255)
#  birthdate           :date
#  email               :string(255)
#  gender              :string(255)
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
#  created_at          :datetime
#  updated_at          :datetime
#

class User < ActiveRecord::Base
  # brcypt validation
  has_secure_password

  # validations
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

  # associations
  has_many :photos
  has_many :posts
  has_and_belongs_to_many :interests

  has_many :received_messages,
                :class_name => 'Message',
                :foreign_key => 'recipient_id'
                # :order => "messages.created_at DESC",
                # :conditions => ["messages.recipient_deleted = ?", false]

  has_many :sent_messages,
                :class_name => 'Message',
                :foreign_key => 'sender_id'

  # def has_facebook_token_or_secure_password
  #   if fb_token.nil?
  #     errors.add()
  #   end
  # end

end
