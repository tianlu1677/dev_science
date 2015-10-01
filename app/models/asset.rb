# == Schema Information
#
# Table name: assets
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  assetable_id   :integer
#  assetable_type :string
#  title          :string
#  desc           :text
#  width          :string
#  height         :string
#  file_size      :string
#  file_type      :string
#  file_name      :string
#  link           :string
#  pdf_link       :text
#  position       :integer
#  status         :string
#  uuid           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Asset < ActiveRecord::Base
  belongs_to :assetable, polymorphic: true

  before_save :update_asset_attributes



  def update_asset_attributes
    if link.present? && link_changed?
      self.file_type = link.file.content_type
      self.file_size = link.file.size
      self.file_name = link.file.filename
      self.title ||= link.file.filename

    end
  end


end
