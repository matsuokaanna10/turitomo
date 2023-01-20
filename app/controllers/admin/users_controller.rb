class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @bulletin_boards = @user.bulletin_boards
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :image, :introduction, :sex, :is_deleted)
    end
end
