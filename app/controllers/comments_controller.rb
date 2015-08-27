class CommentsController < ApplicationController
  # before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  # before_action :correct_user,   only: [:edit, :update]
  # before_action :admin_user,     only: :destroy
  
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
    if @comment.save
      flash[:notice] = 'Your comment was successfully added!'
      redirect_to recipe_path(@recipe)
    else
      flash[:error] = "Comment failed to save"
      render :new
    end
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

