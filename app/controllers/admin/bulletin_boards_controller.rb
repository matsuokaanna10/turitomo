class Admin::BulletinBoardsController < ApplicationController
  def show
    @bulletin_board = BulletinBoard.find(params[:id])
    @comments = @bulletin_board.comments
  end
  
  def destroy
    bulletin_board = BulletinBoard.find(params[:id])
    bulletin_board.destroy
    redirect_to user_path(current_user.id)
  end
  
  private
    def bulletin_board_params
      params.require(:bulletin_board).permit(:title, :content, tag_ids: []).merge(user_id: current_user.id)
    end
end
