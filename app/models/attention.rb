# == Schema Information
#
# Table name: attentions
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  attentionable_id   :integer
#  attentionable_type :string
#  accept_update      :string
#  status             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Attention < ActiveRecord::Base
  belongs_to :attentionable, polymorphic: true
end
