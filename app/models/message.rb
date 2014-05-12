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
  belongs_to :sender,
                    :class_name => 'User',
                    :primary_key => 'user_id',
                    :foreign_key => 'sender_id'
  belongs_to  :recipient,
                    :class_name => 'User',
                    :primary_key => 'user_id',
                    :foreign_key => 'recipient_id'
end
