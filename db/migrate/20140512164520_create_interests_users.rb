class CreateInterestsUsers < ActiveRecord::Migration
  def change
    create_table :interests_users do |t|
      t.integer     :user_id
      t.integer     :interest_id
    end
  end
end
