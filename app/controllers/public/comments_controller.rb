class Public::CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    comment = Comment.new(comment_params)
    comment.save
    redirect_to comment_path(comment.id)
  end
  
  private
    def comment_params
      params.require(:comment).permit(:sentence, :image, :user_id, :bulletin_board_id)
    end
end
