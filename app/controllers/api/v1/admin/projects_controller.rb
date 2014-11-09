class Api::V1::Admin::ProjectsController < AdminController
  layout false
  before_filter :get_project, only: [:show, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def create
    @project = Project.create project_params
    render :show
  end

  def update
    @project.update project_params
    @project.update_categories category_params
    render :show
  end

  def destroy
    @project.destroy
    render nothing: true
  end

  private
  def get_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(Project.whitelisted_attributes)
  end

  def category_params
    params[:project][:categories].nil? ? [] : params[:project][:categories]
  end
end