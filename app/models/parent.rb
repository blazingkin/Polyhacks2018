class Parent < ApplicationRecord
    has_many :children
    validates :points, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

    def self.from_omniauth(auth)
        where(auth.permit(:provider, :uid)).first_or_initialize.tap do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.name = auth.info.name
          user.points ||= 0
          user.oauth_token = auth.credentials.token
          user.oauth_expires_at = Time.at(auth.credentials.expires_at)
          user.save!
        end
    end

end
