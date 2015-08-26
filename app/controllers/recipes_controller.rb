class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    # @recipes = Recipe.all
    @recipes = Recipe.search params[:search]
    @recipes = Recipe.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    @categories = Category.all
  end

  def show
    @recipe = Recipe.find params[:id]
    @previous_recipe = Recipe.where('created_at < ?', @recipe.created_at).
                              order(created_at: :desc).
                              limit(1).first
    @next_recipe = Recipe.where('created_at > ?', @recipe.created_at).
                              order(created_at: :asc).
                              limit(1).first
    @categories = Category.all
  end

  def list
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def edit
     unless current_user && current_user.admin?
       redirect_to(recipe_path(params[:id])) and return
     end
     @recipe = Recipe.find params[:id]
     @categories = Category.all
  end

  def create
     @recipe = Recipe.new recipe_params

    if @recipe.valid?
       @recipe.save!
       redirect_to recipes_path
       flash[:notice] = "Recipe was successfully created." 
     else
       flash[:alert] = "There was an error with adding the recipe"
       render :new
     end
  end

  def update
    @recipe = Recipe.find params[:id]
    if @recipe.update_attributes recipe_params
      flash[:notice] = "Recipe was successfully updated."
      redirect_to recipes_path
    else
      render :edit
    end
  
  end

  def destroy
    @recipe = Recipe.find params[:id]
    @recipe.destroy
    redirect_to recipes_path
    flash[:notice] = "Recipe was successfully destroyed."
  end

  before_filter :check_for_cancel, :only => [:create, :update]

  def check_for_cancel
    if params[:button]
      redirect_to recipes_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:title, :ingredients, :instructions, :category_id, :image)
    end
end
