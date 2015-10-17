# == Schema Information
#
# Table name: resources
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  title             :string
#  resourceable_id   :integer
#  resourceable_type :string
#  desc              :text
#  file_size         :string
#  file_type         :string
#  file_name         :string
#  link              :string
#  pdf_link          :text
#  position          :integer
#  status            :string
#  uuid              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Resource < ActiveRecord::Base

  belongs_to :resourceable, polymorphic: true
  mount_uploader :link, ResourceUploader
  before_save :update_resource_attributes



  def update_resource_attributes
    if link.present? && link_changed?
      self.file_type = link.file.content_type
      self.file_size = link.file.size
      self.file_name = link.file.filename
      self.title ||= link.file.filename

    end
  end


  # jpg jpeg gif png, 判断文件是不是图片
  def image?
    link.content_type.start_with? 'image'
  end

end
