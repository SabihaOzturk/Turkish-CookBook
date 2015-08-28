class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   before_action :authenticate_user!, only: [:new, :edit, :create, :destroy]
  # before_action :logged_in_user, only: [:index, :show, :edit, :update]
  # before_action :correct_user,   only: [:edit, :update]
  # before_action :admin_user,     only: :destroy

  def index
    @categories = Category.all
  end
  def show
    @categories = Category.all
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # # Before filters

    # # Confirms a logged-in user.
    # def logged_in_user
    #   unless logged_in_?
    #     flash[:danger] = "Please log in."
    #     redirect_to login_url
    #   end
    # end
    # # Confirms the correct user.
    # def correct_user
    #   @user = User.find(params[:id])
    #   redirect_to(root_url) unless @user == current_user
    # end
    #  # Confirms an admin user.
    # def admin_user
    #   redirect_to(root_url) unless current_user.admin?
    # end
end
