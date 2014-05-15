# == Schema Information
#
# Table name: interests
#
#  id       :integer          not null, primary key
#  interest :string(255)
#

class Interest < ActiveRecord::Base

  # validations
  validates :interest, presence: true

  # associations
  has_and_belongs_to_many :users

end
