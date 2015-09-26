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
#  status          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  reject_user_id  :integer
#  authority       :string
#

class OrganizationsUser < ActiveRecord::Base
  extend Enumerize
  enumerize :status, in: [:new, :online, :offline], default: :new

  validates :desc, presence: true

  belongs_to :user
  belongs_to :organization

end
