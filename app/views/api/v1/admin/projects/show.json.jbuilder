json.(@project, :id, :name, :start_date, :finish_date, :visible, :content)
json.categories @project.categories.map {|category| category[:name]}
json.images @project.images do |image|
  json.id image.id
  json.name image.file_identifier
  json.url image.file.url
  json.caption image.caption
  json.tag "<img src='#{image.file.url}' alt='#{image.file_identifier}'/>"
end
