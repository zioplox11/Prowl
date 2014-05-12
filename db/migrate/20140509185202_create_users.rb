class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string      :username
      t.string      :password_digest
      t.integer    :height
      t.string      :body_type
      t.date        :birthdate
      t.string      :email
      t.boolean  :admin_status, default: false
      t.timestamps
    end
  end
end
