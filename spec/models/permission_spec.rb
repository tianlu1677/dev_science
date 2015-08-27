# == Schema Information
#
# Table name: permissions
#
#  id            :integer          not null, primary key
#  name          :string
#  subject_name  :string
#  subject_class :string
#  subject_id    :integer
#  action        :string
#  desc          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Permission, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
