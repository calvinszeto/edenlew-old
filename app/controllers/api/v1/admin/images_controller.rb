class Api::V1::Admin::ImagesController < AdminController
  layout false
  before_filter :get_project, only: [:create]
  before_filter :get_image, only: [:update, :upload, :destroy]

  def create
    @image = Image.create(image_params)
    @image.update_attribute :project, @project
  end

  def update
    @image.update(image_params)
  end

  def upload
    @image.update(file_params)
  end

  def destroy
    @image.destroy
  end

  private
  def image_params
    params.require(:image).permit(Image.whitelisted_attributes)
  end

  def file_params
    params.require(:file)
  end

  def get_project
    @project = Project.find(params[:project_id])
  end

  def get_image
    @image = Image.find(params[:id])
  end
end