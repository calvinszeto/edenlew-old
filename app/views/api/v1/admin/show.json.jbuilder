json.(@project, :id, :name, :start_date, :finish_date, :visible)
json.categories @project.categories, :name
json.images @project.images,
