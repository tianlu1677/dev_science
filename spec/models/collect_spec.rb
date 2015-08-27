# == Schema Information
#
# Table name: collects
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  context_id   :integer
#  context_type :string
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Collect, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
