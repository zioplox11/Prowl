class MessagesController < ApplicationController

  def index

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
