class FacebookUser < User
  validates :fb_token, :fb_expiration, presence: true
  validates :fb_token, uniqueness: true

end
