class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :
      t.integer :height_feet
      t.integer :height_inches
      t.string :body_type
      t.integer :age
    end
  end
end
