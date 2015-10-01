json.files @attachments do |attachment|
  json.name           attachment.file_name
  json.size           attachment.file_size.to_i
  json.url            attachment.link.url
  json.thumbnailUrl   attachment.thumbanil_url
  json.deleteUrl      "/attachments/#{attachment.id}"
  json.deleteType     "DELETE"
end
