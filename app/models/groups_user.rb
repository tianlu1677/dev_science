# == Schema Information
#
# Table name: groups_users
#
#  id             :integer          not null, primary key
#  group_id       :integer
#  user_id        :integer
#  role_id        :integer
#  type           :string
#  status         :string
#  desc           :text
#  apply_at       :datetime
#  reject_reason  :text
#  reject_at      :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  reject_user_id :integer
#  authority      :string
#

class GroupsUser < ActiveRecord::Base

  extend Enumerize
  enumerize :authority, in: [:super_admin, :admin, :member], default: :member
  enumerize :status, in: [:new, :online, :offline], default: :online

  scope :checking,       -> { where(status: :new) }
  scope :online,         -> { where(status: :online) }
  scope :offline,        -> { where(status: :offline) }

  belongs_to :user
  belongs_to :group

  validates :desc, presence: true

end
