class Api::V1::Admin::CategoriesController < AdminController
  layout false

  def index
    @categories = Category.all
  end

  def create
    Category.create(category_params)
    @categories = Category.all
    render :index
  end

  def destroy
    Category.find(params[:id]).destroy
    @categories = Category.all
    render :index
  end

  private
  def category_params
    params.require(:category).permit(Category.whitelisted_attributes)
  end
end