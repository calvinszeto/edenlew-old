class ProjectsController < ApiController
  layout false
  before_filter get_project, only: [:show, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def create
    @project = Project.create project_params
  end

  def update
    @project.update project_params
  end

  def destroy
    @project.destroy
  end

  private
  def get_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(Project.whitelisted_attributes)
  end
end