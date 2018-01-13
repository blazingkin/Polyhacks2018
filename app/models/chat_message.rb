class ChatMessage < ApplicationRecord
    belongs_to :parent
    validates :parent, presence: true
    validates :recipient_fk, presence: true

    def recipient
        Parent.find(recipient_fk)
    end


end
