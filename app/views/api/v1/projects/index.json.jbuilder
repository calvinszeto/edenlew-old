json.array! @projects do |project|
  json.(project, :id, :name, :start_date, :finish_date)
  json.categories project.categories, :name
  json.icon_url project.icon_url
end