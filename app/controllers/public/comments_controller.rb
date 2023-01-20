class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save!
    redirect_to bulletin_boards_path
  end

  private
    def comment_params
      params.require(:comment).permit(:sentence, :bulletin_board_id, :image).merge(user_id: current_user.id)
    end
end
