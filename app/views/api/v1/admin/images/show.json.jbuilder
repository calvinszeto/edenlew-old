json.id @image.id
json.name @image.file_identifier
json.url @image.file.url
json.caption @image.caption
json.primary_icon @image.primary_icon
json.tag "<img src='#{@image.file.url}' alt='#{@image.file_identifier}'/>"
