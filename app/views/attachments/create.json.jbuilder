

# json.files @attachment do |attachment|
#   json.name = attachment.file_name
#   json.size = attachment.file_size
#   json.url = attachment.link.url
#   json.thumbnailUrl = attachment.link.url
#   json.deleteUrl = attachment.id
#   json.deleteType = "DELETE"
@attachments = Attachment.where(id: @attachment.id)
json.files @attachments do |attachment|
      json.name attachment.file_name
      json.size  attachment.file_size
      json.url  attachment.link.url
      json.thumbnailUrl  attachment.link.url
      json.deleteUrl  attachment.id
      json.deleteType  "DELETE"
end

#
# {"files": [
#     {
#         "name": "picture1.jpg",
#     "size": 902604,
#     "url": "http:\/\/example.org\/files\/picture1.jpg",
#     "thumbnailUrl": "http:\/\/example.org\/files\/thumbnail\/picture1.jpg",
#     "deleteUrl": "http:\/\/example.org\/files\/picture1.jpg",
#     "deleteType": "DELETE"
# },
#     {
#         "name": "picture2.jpg",
#     "size": 841946,
#     "url": "http:\/\/example.org\/files\/picture2.jpg",
#     "thumbnailUrl": "http:\/\/example.org\/files\/thumbnail\/picture2.jpg",
#     "deleteUrl": "http:\/\/example.org\/files\/picture2.jpg",
#     "deleteType": "DELETE"
# }
# ]}