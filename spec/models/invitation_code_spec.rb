# == Schema Information
#
# Table name: invitation_codes
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  code       :string
#  timeout    :string
#  status     :string
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe InvitationCode, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
