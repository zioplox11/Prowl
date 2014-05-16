class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string      :username
      t.string      :password_digest
      t.string      :height
      t.string      :sexual_orientation
      t.string      :body_type
      t.date        :birthdate
      t.string      :email
      t.string      :gender
      t.string      :borough
      t.string      :neighborhood
      t.boolean  :admin_status, default: false
      t.string      :ethnicity
      t.string      :diet
      t.string      :drugs
      t.string      :drinks
      t.string      :smokes
      t.string      :zodiac_sign
      t.string      :education
      t.string      :job
      t.string      :income
      t.string      :relationship_status
      t.string      :relationship_type
      t.string      :children_family
      t.string      :languages
      t.string      :pets
      t.text         :self_summary
      t.string      :looking_for
      t.text         :profile_image_url, default: "http://i.imgur.com/vTeB8gz.png"
      t.timestamps
    end
  end
end
