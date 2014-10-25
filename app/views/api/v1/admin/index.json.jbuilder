json.array! @projects do |project|
  json.(project, :id, :name, :start_date, :finish_date, :created_at, :updated_at, :visible)
  json.categories project.categories, :name
end