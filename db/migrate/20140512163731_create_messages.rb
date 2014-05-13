class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
        t.text         :body
        t.integer    :sender_id
        t.integer    :recipient_id
        t.boolean   :sender_deleted, :recipient_deleted, :default => false
        t.datetime  :read_at
        t.timestamps
    end
  end
end
