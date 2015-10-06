# == Schema Information
#
# Table name: organizations_users
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  organization_id :integer
#  desc            :text
#  apply_at        :datetime
#  reject_reason   :text
#  reject_at       :datetime
#  reject_user_id  :integer
#  authority       :string
#  status          :string
#  role_type       :string
#  role_id         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class OrganizationsUser < ActiveRecord::Base
  extend Enumerize
  enumerize :status, in: [:check, :online, :offline], default: :check
  enumerize :role_type, in: [:organization_admin, :member], default: nil
  validates :desc, presence: true

  belongs_to :user
  belongs_to :organization

  scope :check,  -> { where(status: :check) }
  scope :online,    -> { where(status: :online) }
  scope :offline,   -> { where(status: :offline) }
  scope :organization_admin, -> { where(role_type: :organization_admin, status: :online)}
  scope :organization_super_admin, -> { where(role_type: :organization_super_admin, status: :online)}

  delegate :username, :email, to: :user, prefix: true, allow_nil: true

end
