# == Schema Information
#
# Table name: organizations
#
#  id             :integer          not null, primary key
#  name           :string
#  city           :string
#  short_name     :string
#  logo           :string
#  intro          :text
#  desc           :text
#  website        :string
#  address        :string
#  contact_name   :string
#  contact_mobile :string
#  parent_id      :integer
#  lft            :integer          not null
#  rgt            :integer          not null
#  depth          :integer          default(0), not null
#  children_count :integer          default(0), not null
#  position       :integer
#  status         :string
#  super_admin_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Organization < ActiveRecord::Base
  extend Enumerize
  enumerize :status, in: [:check, :online, :offline], default: :check

  acts_as_nested_set

  mount_uploader :logo, OrganizationLogoUploader

  has_many :groups_organizations, dependent: :destroy
  has_many :groups, through: :groups_organizations

  has_many :memberships, as: :manageable, dependent: :destroy
  has_many :users, through: :memberships

  belongs_to :parent, class_name: "Organization"
  belongs_to :super_admin, class_name: "User", foreign_key: :super_admin

  scope :check, -> {where(status: :check)}
  scope :online, -> {where(status: :online)}
  scope :offline, -> {where(status: :offline)}

  validates :name, :city, :short_name, :intro, :desc, :address, :contact_name, :contact_mobile, presence: true

end
