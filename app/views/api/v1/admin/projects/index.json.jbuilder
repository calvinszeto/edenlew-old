json.array! @projects do |project|
  json.(project, :id, :name, :start_date, :finish_date, :created_at, :updated_at, :visible)
  json.categories project.categories, :name
  json.images project.images do |image|
    json.name image.file.identifier
    json.url image.file.url
    json.caption image.caption
    json.tag "<img src='#{image.file.url}' alt='#{image.caption}'/>"
  end
end