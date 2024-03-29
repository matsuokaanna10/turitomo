class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bulletin_boards = @user.bulletin_boards
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path
  end
  
  def withdraw
    user = current_user
    user.update(user_params)
    reset_session
    redirect_to root_path
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :image, :introduction, :sex, :is_deleted)
    end
end
