# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string
#  desc       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ActiveRecord::Base
  extend Enumerize
  has_and_belongs_to_many :users
  has_and_belongs_to_many :permissions
  accepts_nested_attributes_for :permissions

  enumerize :basename, in: [:god_admin,:organization_super_admin, :organization_admin,
                            :group_super_admin, :group_admin, :user]


  validates :name, presence: true
end
