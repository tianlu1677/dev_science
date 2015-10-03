# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  commentable_id   :integer
#  commentable_type :string
#  content          :text
#  floor            :integer
#  parent_id        :integer
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base
  extend Enumerize
  enumerize :status, in: [:new, :online, :offline], default: :online
  belongs_to :parent, class_name: "Comment", foreign_key: :parent_id
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  # has_closure_tree
  delegate :username, to: :user, prefix: true, allow_nil: true
  validates :content, presence: true

end
