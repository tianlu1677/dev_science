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
#  logo       :string
#

class Group < ActiveRecord::Base
  extend Enumerize
  enumerize :status, in: [:new, :online, :offline], default: :online
  enumerize :privacy, in: [:hidden, :protected, :public], default: :public

  mount_uploader :logo, GroupLogoUploader

  has_many :groups_organizations, dependent: :destroy
  has_many :organizations, through: :groups_organizations

  has_many :memberships, as: :manageable, dependent: :destroy
  has_many :memberships, as: :memberable, dependent: :destroy

  # has_many :group_members, -> { where(manageable_id: self.id, manageable_type: "Group").order("position") }, class_name: "Membership"

  has_many :topics, as: :topicable, dependent: :destroy
  has_many :posts, as: :postable, dependent: :destroy

  validates :name, :intro, :desc, :logo, presence: true


end

