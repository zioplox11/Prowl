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
#  fb_token            :string(255)
#  fb_expiration       :integer
#  zip                 :integer
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

  has_many :other_profile_views,
                  :class_name => 'ProfileView',
                  :foreign_key => 'viewer_id'

  has_many :who_have_viewed_my_profile,
                  :class_name => 'ProfileView',
                  :foreign_key => 'viewed_id'



  def find_or_create_from_auth_hash(auth_hash)
    user = User.find_by(email: auth_hash['info']['email'])
    if user
      user.update(
        fb_token:      auth_hash['credentials']['token'],
        fb_expiration: auth_hash['credentials']['token']
        )
      return user
    else
      User.new(
        username:      auth_hash['info']['email'],
        email:         auth_hash['info']['email'],
        fb_token:      auth_hash['credentials']['token'],
        fb_expiration: auth_hash['credentials']['token']
        )
    end

  end

end
