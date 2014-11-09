json.(@project, :id, :name, :start_date, :finish_date, :visible)
json.categories @project.categories.map {|category| category[:name]}
json.images @project.images do |image|
  json.name image.file.identifier
  json.url image.file.url
  json.caption image.caption
  json.tag "<img src='#{image.file.url}' alt='#{image.caption}'/>"
end
