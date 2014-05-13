class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
          t.string    :interest
    end
  end
end
