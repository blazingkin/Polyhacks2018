class ChatMessage < ApplicationRecord
    belongs_to :parent
    validates :parent, presence: true
    validates :recipient_fk, presence: true
    validates :message, presence: true
    scope :participant, -> (user) {user.chat_messages + where(recipient_fk: user.id)}

    def recipient
        Parent.find(recipient_fk)
    end


end
