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
  extend Enumerize
  enumerize :status, in: [:new, :online, :offline], default: :online
  enumerize :privacy, in: [:hidden, :protected, :public], default: :public

  has_many :groups_organizations, dependent: :destroy
  has_many :organizations, through: :groups_organizations

  has_many :groups_users, dependent: :destroy
  has_many :users, through: :groups_users

  has_many :topics, as: :context, dependent: :destroy
  has_many :posts, as: :context, dependent: :destroy

  validates :name, :intro, :desc, presence: true


end

