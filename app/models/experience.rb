# == Schema Information
#
# Table name: experiences
#
#  id              :integer          not null, primary key
#  time_duration   :string
#  experience_type :string
#  experience_role :string
#  diploma         :string
#  desc            :text
#  place           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Experience < ActiveRecord::Base
end
