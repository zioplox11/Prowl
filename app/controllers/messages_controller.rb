class MessagesController < ApplicationController

  # backbone
  # Collection.extend({
    # url: "/messages"
    # })

  def index
    # retrieves the most current messages for each conversation
    inbox = get_inbox(current_user)
    render json: inbox
  end

  def create
    message = current_user.sent_messages.create(message_params)
    render json: message

    # testUser.sent_messages.create({body: 'So how is your job these days? Are you getting along with your boss?', recipient_id: testUser2.id})
    # testUser2.received_messages.where({sender_id: testUser.id})
    # testUser.sent_messages.where({sender_id: testUser2.id})
    # testUser2.sent_messages.create({body: 'My job is going fine. Boring lately but I should not complain', recipient_id: testUser.id})
  end

  # GET /messages/:id (of other person)
  def conversation
    current_user_id
    other_user_id = params[]
    messages = get_conversation(current_user_id, other_user_id)
    render json: messages
  end

  def destroy
    message = Message.find_by(message_params)
    message.delete_all
  end

  private

    def set_photo
      @message = Message.find(params[:id])
    end

    def messages_params
      params.require(:message).permit(
        :sender_id,
        :recipient_id,
        :body,
        :created_at,
        :updated_at,
        :sender_deleted,
        :recipient_deleted,
        :read_at
      )
    end


end
