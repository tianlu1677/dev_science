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

require 'rails_helper'

RSpec.describe GroupsUser, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
