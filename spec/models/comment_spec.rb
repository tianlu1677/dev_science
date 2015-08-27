# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  post_id        :integer
#  body           :text
#  post_body      :text
#  parent_id      :integer
#  lft            :integer          not null
#  rgt            :integer          not null
#  depth          :integer          default(0), not null
#  children_count :integer          default(0), not null
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
