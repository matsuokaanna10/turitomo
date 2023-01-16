class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comments = BulletinBoard.find(params[:id])
    @new_comment.save!
    redirect_to bulletin_boards_path
  end

  private
    def comment_params
      params.require(:comment).permit(:sentence, :image).merge(user_id: current_user.id, bulletin_board_id: @bulletin_board.id)
    end
end
