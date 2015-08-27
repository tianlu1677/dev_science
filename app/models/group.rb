# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  short_name :string
#  intro      :text
#  desc       :text
#  website    :string
#  privacy    :string
#  position   :integer
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ActiveRecord::Base
end
