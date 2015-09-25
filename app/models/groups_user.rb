# == Schema Information
#
# Table name: groups_users
#
#  id            :integer          not null, primary key
#  group_id      :integer
#  user_id       :integer
#  role_id       :integer
#  type          :string
#  status        :string
#  desc          :text
#  apply_at      :datetime
#  reject_reason :text
#  reject_at     :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class GroupsUser < ActiveRecord::Base

  belongs_to :user
  belongs_to :group

  validates :desc, presence: true

end
