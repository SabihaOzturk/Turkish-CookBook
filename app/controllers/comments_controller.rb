class CommentsController < ApplicationController
  def index
    @recipe = Recipe.find params[:recipe_id]
    @comment = @recipe.comments.find params[:recipe_id]
  end

  def show
    @recipe = Recipe.find params[:recipe_id]
    @comment = @recipe.comments.find params[:recipe_id]
  end

  def new
    @recipe = Recipe.find params[:recipe_id]
    @comment = @recipe.comments.new
    # if params[:recipe_id].present?
    #     @recipe = Recipe.find params[:recipe_id]
    #     @comment = Comment.new
    # end
  end

  def create
    @recipe = Recipe.find params[:recipe_id]
    @comment = @recipe.comments.create comment_params
    redirect_to recipe_path(@recipe)
  end

  def edit
    @recipe = Recipe.find params[:recipe_id]
    @comment = @recipe.comments.find params[:recipe_id]
  end

  def update 
    @recipe = Recipe.find params[:recipe_id]
    @comment = Comment.find params[:id] 
    if @comment.update_attributes params[:id] 
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def destroy
    # @recipe = Recipe.find params[:id]
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to recipes_path
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body )
    end
end

