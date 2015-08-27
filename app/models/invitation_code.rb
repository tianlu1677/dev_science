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

class InvitationCode < ActiveRecord::Base
end
