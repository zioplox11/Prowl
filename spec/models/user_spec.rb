# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string(255)
#  password_digest :string(255)
#  height          :integer
#  body_type       :string(255)
#  birthdate       :date
#  email           :string(255)
#  admin_status    :boolean          default(FALSE)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe 'sanity' do

  it 'should be sane' do
    expect(2+2).to eq 4
  end

end
