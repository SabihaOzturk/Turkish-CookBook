class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
   Category.create category_params
   redirect_to categories_path
  end

  def show
    @category = Category.find params[:id]
    @categories = Category.all
    @recipes = @category.recipes.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    render 'recipes/index'
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to categories_path
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    category = Category.find params[:id]
    category.update category_params
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
