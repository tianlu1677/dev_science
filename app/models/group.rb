# == Schema Information
#
# Table name: groups
#
#  id             :integer          not null, primary key
#  name           :string
#  short_name     :string
#  intro          :text
#  desc           :text
#  logo           :string
#  website        :string
#  privacy        :string
#  position       :integer
#  status         :string
#  super_admin_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Group < ActiveRecord::Base
  extend Enumerize
  enumerize :status, in: [:online, :offline], default: :online
  enumerize :privacy, in: [:hidden, :protected, :public], default: :public

  mount_uploader :logo, GroupLogoUploader

  has_many :groups_organizations, dependent: :destroy
  has_many :organizations, through: :groups_organizations

  has_many :memberships, as: :manageable, dependent: :destroy
  has_many :memberships, as: :memberable, dependent: :destroy

  has_many :topics, as: :topicable, dependent: :destroy
  has_many :posts, as: :postable, dependent: :destroy

  belongs_to :super_admin, class_name: "User", foreign_key: :super_admin

  validates :name, :intro, :desc, presence: true
  default_scope { where(status: :online)}

end

