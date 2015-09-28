# == Schema Information
#
# Table name: collects
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  collectable_id   :integer
#  collectable_type :string
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Collect < ActiveRecord::Base
  belongs_to :collectable, polymorphic: true
end
