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

require 'rails_helper'

RSpec.describe GroupsOrganization, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
