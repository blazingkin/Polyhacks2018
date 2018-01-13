class ChatController < ApplicationController

    def send_message
        @message = ChatMessage.new(message_params)
        @message.parent = current_user
        if params['recipient'].nil?
            flash[:danger] = 'Message requires a recipient'
            redirect_to '/'
        end
        recipient = Parent.find_by(uid: recipient)
        if recipient.nil?
            flash[:danger] = 'Invalid recipient'
            redirect_to '/'
        end
        @message.recipient_fk = recipient.id
        if @message.save

        else
            flash[:danger] = @message.errors
            redirect_to '/'
        end
    end

    def list
        p 'loading list'
        @chatting_with = current_user.chatting_with
    end

    def chat

    end

    private
        def message_params
            params.require(:message)
        end

end
