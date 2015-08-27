# == Schema Information
#
# Table name: attentions
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  context_id    :integer
#  context_type  :string
#  accept_update :string
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Attention, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
