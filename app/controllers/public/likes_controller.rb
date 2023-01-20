class Public::LikesController < ApplicationController
  def show
    likes = Like.where(user_id: @user.id).pluck(:bulletin_board_id)
    @like_bulletin_boards = BulletinBoard.find(likes)
  end

  def create
    @like = current_user.likes.create(bulletin_board_id: params[:bulletin_board_id])
    @like.save
    redirect_back(fallback_location: bulletin_boards_path)
  end

  def destroy
    @like = Like.find_by(bulletin_board_id: params[:bulletin_board_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: bulletin_boards_path)
  end

  private
    def likes_params
      params.require(:likes).permit(:name, :user_id, :bulletin_board_id)
    end
end
