class Api::V1::ProjectsController < ApiController
  layout false

  def index
    @projects = Project.where(visible: true).order(finish_date: :desc)
  end

  def show
    @project = Project.find(params[:id])
    render status: 404 unless @project.visible
  end
end