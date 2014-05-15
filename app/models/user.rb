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

  # validations
  validates :username, :email,
    uniqueness: { case_sensitive: false },
    presence: true

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

  def self.random_username(auth_hash)
    found_name = false
    until found_name
      random_name = auth_hash['info']['first_name'].downcase + rand(9999).to_s
      if User.find_by(username: random_name ).nil?
        username = random_name
        found_name = true
      end
    end
    return username
  end

  def self.find_or_create_from_auth_hash(auth_hash)
    user = User.find_by(email: auth_hash['info']['email'])
    token = auth_hash['credentials']['token']
    expiration_time = auth_hash['credentials']['expires_at']
    if user
      user.update(
        fb_token:      token,
        fb_expiration: expiration_time
        )
    else
      user = FacebookUser.create(
        username:      User.random_username(auth_hash),
        email:         auth_hash['info']['email'],
        fb_token:      token,
        fb_expiration: expiration_time
        )
    end
    return user
  end

  def self.random_username(auth_hash)
    found_name = false
    until found_name
      random_name = auth_hash['info']['first_name'].downcase + rand(9999).to_s
      if User.find_by(username: random_name).nil?
        username = random_name
        found_name = true
      end
    end
    return username
  end

end
