# == Schema Information
#
# Table name: memberships
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  manageable_id   :integer
#  manageable_type :string
#  memberable_id   :integer
#  memberable_type :string
#  desc            :text
#  apply_at        :datetime
#  reject_reason   :text
#  reject_at       :datetime
#  last_user_id    :integer
#  status          :string
#  role_type       :string
#  role_id         :string
#  join_type       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Membership < ActiveRecord::Base
  extend Enumerize
  enumerize :status, in: [:check, :online, :offline], default: :check
  enumerize :role_type, in: [:admin, :member], default: :member
  enumerize :join_type, in: [:oneself, :invite], default: :oneself
  validates :desc, presence: true

  belongs_to :manageable, polymorphic: true
  belongs_to :memberable, polymorphic: true

  scope :check,  -> { where(status: :check) }
  scope :online,    -> { where(status: :online) }
  scope :offline,   -> { where(status: :offline) }
  scope :admin, -> { where(role_type: [:admin, :super_admin], status: :online)}
  scope :super_admin, -> { where(role_type: :super_admin, status: :online)}
  scope :manage, -> { where(role_type: [:admin, :super_admin], status: :online)}

  delegate :user_username, :user_email, to: :memberable, allow_nil: true

end
