class Api::V1::Admin::CategoriesController < AdminController
  layout false

  def index
    @categories = Category.all
  end

  def create
    @category = Category.create(category_params)
    render :show
  end

  def destroy
    Category.find(params[:id]).destroy
    @categories = Category.all
    render nothing: true
  end

  private
  def category_params
    params.require(:category).permit(Category.whitelisted_attributes)
  end
end