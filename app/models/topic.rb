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
  extend Enumerize
  enumerize :status, in: [:new, :online, :offline], default: :online
  belongs_to :user
  belongs_to :context, polymorphic: true
  has_many :posts, as: :context, dependent: :destroy

  acts_as_taggable

  validates :title, :body, presence: true
  # enum status: [:new, :online, :offline].map { |x| I18n.t("user.role_types.#{x}") }
  delegate :username, to: :user, prefix: true, allow_nil: true
end
