class MessagesController < ApplicationController
  before_action :set_message, only: [:conversation, :destroy]

  # GET /messages
  def index
    # retrieves the most current messages for each conversation
    @inbox = get_inbox(current_user)
    render json: @inbox
  end

  # GET /messages/:id (of other person)
  def conversation
    current_user_id = current_user.id
    other_user_id = params[:id]
    @messages = get_conversation(current_user_id, other_user_id)
    render json: @messages
  end

  # POST /messages
  def create
    @message = current_user.sent_messages.new(message_params)
    if @message.save
      render json: 'Message sent!', status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/:id (of the message)
  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    render json: 'Message was successfully deleted', status: :ok
  end

  private

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
