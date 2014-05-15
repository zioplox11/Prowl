# == Schema Information
#
# Table name: messages
#
#  id                :integer          not null, primary key
#  body              :text
#  sender_id         :integer
#  recipient_id      :integer
#  sender_deleted    :boolean          default(FALSE)
#  recipient_deleted :boolean          default(FALSE)
#  read_at           :datetime
#  created_at        :datetime
#  updated_at        :datetime
#

class Message < ActiveRecord::Base

  # validations
  validates :body, presence: true

  validates :sender_id, :recipient_id,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0
       },
    presence: true

  # assocations
  belongs_to :sender,
    :class_name => 'User',
    :foreign_key => 'sender_id'
  belongs_to  :recipient,
    :class_name => 'User',
    :foreign_key => 'recipient_id'

  def self.get_conversation(current_user_id, other_user_id)
    query_string = "sender_id = ? AND recipient_id = ? OR sender_id = ? AND recipient_id = ?"
    messages = Message.where(
      query_string,
      current_user_id.to_s,
      other_user_id.to_s,
      other_user_id.to_s,
      current_user_id.to_s
    ).order('created_at')
    return messages
  end

  # inefficient SQL queries here, could use some refactoring
  def self.get_inbox(current_user)
    first_set = current_user.received_messages.select(:sender_id).uniq.map { |m| m.sender_id }
    second_set = current_user.sent_messages.select(:recipient_id).uniq.map { |m| m.recipient_id }
    unique_set = [first_set, second_set].flatten.uniq
    inbox = unique_set.map do |other_id|
      get_conversation(current_user.id, other_id)[0]
    end
    return inbox
  end

end
