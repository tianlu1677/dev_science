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

  validates :name, :intro, :desc, presence: true


end