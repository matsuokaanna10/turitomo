class Public::LikesController < ApplicationController
  def create
    @like = current_user.likes.create(bulletin_board_id: params[:bulletin_board_id])
    redirect_back(fallback_location: bulletin_boards_path)
  end

  def destroy
    @like = Like.find_by(bulletin_board_id: params[:bulletin_board_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: bulletin_boards_path)
  end
end
