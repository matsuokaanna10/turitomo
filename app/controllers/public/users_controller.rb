class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @bulletin_boards = current.bulletin_board.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path
  end
end
