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

class Attachment < Asset

  mount_uploader :link, AttachmentUploader

end
