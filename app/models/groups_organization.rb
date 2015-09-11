# == Schema Information
#
# Table name: groups_organizations
#
#  id              :integer          not null, primary key
#  group_id        :integer
#  organization_id :integer
#  desc            :text
#  apply_at        :datetime
#  reject_reason   :text
#  reject_at       :datetime
#  status          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class GroupsOrganization < ActiveRecord::Base
  belongs_to :organization
  belongs_to :group
end

Group.limit(5).each do |g|
  GroupsOrganization.create(group_id: g.id, organization_id: 1, status: "online" )

end