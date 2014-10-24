class Api::V1::ProjectsController < ApiController
  layout false

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end
end