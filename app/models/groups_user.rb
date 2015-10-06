# == Schema Information
#
# Table name: groups_users
#
#  id            :integer          not null, primary key
#  group_id      :integer
#  user_id       :integer
#  role_id       :integer
#  role_type     :string
#  status        :string
#  desc          :text
#  apply_at      :datetime
#  reject_reason :text
#  reject_at     :datetime
#  last_user_id  :integer
#  authority     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class GroupsUser < ActiveRecord::Base

  extend Enumerize
  enumerize :role_type, in: [:group_admin, :member], default: nil
  enumerize :status, in: [:check, :online, :offline]

  belongs_to :user
  belongs_to :group

  scope :check,               -> { where(status: :check) }
  scope :online,              -> { where(status: :online) }
  scope :offline,             -> { where(status: :offline) }
  scope :group_admin,         -> { where(role_type: :group_admin, status: :online)}
  scope :group_super_admin,   -> { where(role_type: :group_super_admin, status: :online)}
  scope :admin,               -> { where(role_type: [:organization_admin, :organization_super_admin], status: :online)}

  validates :desc, presence: true
  delegate :username, :email, to: :user, prefix: true, allow_nil: true


end
