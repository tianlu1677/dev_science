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

class Attachment < Resource

  mount_uploader :link, AttachmentUploader

  def output_json
    {
        "name" => file_name,
        "size" => file_size.to_i,
        "url" => link.url,
        "deleteUrl" => "/attachments/#{id}",
        "picture_id" => id,
        "thumbnailUrl" => thumbanil_url,
        "delete_type" => "DELETE",
        "title" => title
    }
  end

  # 七牛进行裁剪，文档 http://developer.qiniu.com/docs/v6/api/reference/fop/image/imageview2.html
  def thumbanil_url
    image? ? "#{link.url}?imageView2/0/w/100/h/100" : nil
  end

end
