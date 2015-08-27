# == Schema Information
#
# Table name: topics
#
#  id           :integer          not null, primary key
#  context_id   :integer
#  context_type :string
#  user_id      :integer
#  title        :text
#  body         :text
#  views_count  :integer
#  posts_count  :integer
#  position     :integer
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Topic < ActiveRecord::Base
end
