class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :password_digest
      t.integer :height_feet
      t.integer :height_inches
      t.string :body_type
      t.integer :age
      t.string :email
      t.boolean    :admin_status, default: false
      t.timestamps
    end
  end
end
