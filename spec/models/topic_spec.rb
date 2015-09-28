# == Schema Information
#
# Table name: topics
#
#  id             :integer          not null, primary key
#  topicable_id   :integer
#  topicable_type :string
#  user_id        :integer
#  title          :text
#  body           :text
#  views_count    :integer          default(0)
#  posts_count    :integer          default(0)
#  position       :integer
#  status         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Topic, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
