class Parent < ApplicationRecord
    has_many :children
    has_many :chat_messages
    has_many :job_listings
    validates :points, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    #validates :email, length: { maximum: 255 },
    #                format: { with: VALID_EMAIL_REGEX }

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

    # Makes way too many db calls, but whatevah
    def chatting_with
        ChatMessage.participant(self).map do |chat|
            if chat.parent.id != self.id
                chat.parent
            else
                Parent.find(chat.recipient_fk)
            end
        end.uniq
    end

    def messages_with(user)
        ChatMessage.participant(self).select do |message|
            message.parent.id == user.id || message.recipient_fk == user.id
        end
    end

end
