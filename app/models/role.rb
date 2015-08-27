# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string
#  desc       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ActiveRecord::Base
end
