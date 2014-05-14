class MessagesController < ApplicationController

  # /users/:id/messages

  # backbone
  # Collection.extend({
    # url: "/messages"
    # })
  def index
    # all messages to me
    inbox = Message.where({recipient_id: current_user.id})
    # all messages from me
    outbox = Message.where({sender_id: current_user.id})
    render json: inbox + outbox
    # Message.where({sender_id: user.id, recipient_id: other_user.id})
    # Message.where({sender_id: other_user.id, recipient_id: user.id})

  end

  def create

    # testUser.sent_messages.create({body: 'So how is your job these days? Are you getting along with your boss?', recipient_id: testUser2.id})
    # testUser2.received_messages.where({sender_id: testUser.id})
    # testUser.sent_messages.where({sender_id: testUser2.id})
    # testUser2.sent_messages.create({body: 'My job is going fine. Boring lately but I should not complain', recipient_id: testUser.id})

  end

  def show

    # testUser.sent_messages.create({body: 'So how is your job these days? Are you getting along with your boss?', recipient_id: testUser2.id})
    # testUser2.received_messages.where({sender_id: testUser.id})
    # testUser.sent_messages.where({sender_id: testUser2.id})
    # testUser2.sent_messages.create({body: 'My job is going fine. Boring lately but I should not complain', recipient_id: testUser.id})

  end

  def find
    current_user_id
    other_user_id
    query_string = "sender_id = ? AND recipient_id = ? OR sender_id = ? AND recipient_id = ?"
    @conversation = Message.where(
      query_string,

  end

  def destroy

  end

  def update

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
