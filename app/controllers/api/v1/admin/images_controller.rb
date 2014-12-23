class Api::V1::Admin::ImagesController < AdminController
  layout false
  before_filter :get_project, only: [:create]
  before_filter :get_image, only: [:update, :destroy]

  def create
    @image = Image.create(file_params)
    @image.update_attribute :project, @project
    render 'show'
  end

  def update
    @image.update(image_params)
    render 'show'
  end

  def destroy
    @image.destroy
    render nothing: true
  end

  private
  def image_params
    params.require(:image).permit(Image.whitelisted_attributes)
  end

  def file_params
    params.permit(:file)
  end

  def get_project
    @project = Project.find(params[:project_id])
  end

  def get_image
    @image = Image.find(params[:id])
  end
end