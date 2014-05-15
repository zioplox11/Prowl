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

require 'spec_helper'

describe Message do
  describe "conversations" do

    before :each do
      @user1 = VanillaUser.create!(username: 'admin', email: 'admin@admin.com', password: '12345678', password_confirmation: '12345678', admin_status: true)
      @user2 = VanillaUser.create!(username: 'molly', email: 'molly@molly.com', password: '12345678', password_confirmation: '12345678', admin_status: false)
      @user3 = VanillaUser.create(username: 'megan', email: 'megan@megan.com', password: '12345678', password_confirmation: '12345678', admin_status: false)

      Message.create(body: 'testing the waters', sender_id: @user1.id, recipient_id: @user2.id)
      Message.create(body: 'testing the waters again', sender_id: @user1.id, recipient_id: @user2.id)
      Message.create(body: 'testing the waters yet again', sender_id: @user1.id, recipient_id: @user2.id)
      Message.create(body: 'hi there', sender_id: @user2.id, recipient_id: @user1.id)

      Message.create(body: 'testing the waters', sender_id: @user1.id, recipient_id: @user3.id)
      Message.create(body: 'testing the waters again', sender_id: @user1.id, recipient_id: @user3.id)
      Message.create(body: 'testing the waters yet again', sender_id: @user1.id, recipient_id: @user3.id)
      Message.create(body: 'hi there', sender_id: @user3.id, recipient_id: @user1.id)
    end

    it "gets the correct number of messages per conversation" do
      convo = Message.get_conversation(@user1.id, @user2.id)
      expect(convo.length).to eq 4
    end

    it "gets the correct number of messages for inboxes" do
      inbox = Message.get_inbox(@user1)
      expect(inbox.length).to eq 2
    end
  end
end
