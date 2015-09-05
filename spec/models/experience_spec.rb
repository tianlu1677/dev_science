# == Schema Information
#
# Table name: experiences
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  time_duration   :string
#  experience_type :string
#  experience_role :string
#  diploma         :string
#  desc            :text
#  place           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Experience, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
