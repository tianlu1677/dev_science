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

class Permission < ActiveRecord::Base
end
