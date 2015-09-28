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

class Topic < ActiveRecord::Base
  extend Enumerize
  enumerize :status, in: [:new, :online, :offline], default: :online

  belongs_to :user
  belongs_to :topicable, polymorphic: true
  has_many :posts, as: :postable, dependent: :destroy

  acts_as_taggable

  validates :title, :body, presence: true
  # enum status: [:new, :online, :offline].map { |x| I18n.t("user.role_types.#{x}") }
  delegate :username, to: :user, prefix: true, allow_nil: true
end
